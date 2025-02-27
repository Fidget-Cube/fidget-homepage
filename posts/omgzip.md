# OMGzip
## OMG, it's a .zip! 
> solves: 79  
> points: 56  
> challenge file(s): [omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/omgzip), [data.tar.omgzip](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/data.tar.omgzip)  
> solution file(s): [decompressor.py](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/decompressor.py)  
> original challenge github: https://github.com/Nautilus-Institute/quals-2023/tree/main/omgzip  

Just this past weekend, [Pacific Hackers Association](https://www.meetup.com/pacifichackers/) and [HackMiami](https://www.meetup.com/hackmiami/) joined forces to compete in the [DEFCON CTF Qualifiers](https://quals.2023.nautilus.institute/index.html). The top 12 teams from this CTF go on to play the most competitive and challenging CTF in the world at DEFCON 31. Though, to be fair, our team wasn't of that caliber. We were able to solve 2 challenges (not counting the sanity checks) and finished in 92nd place, which is a great success by my standards! I was able to solve this one with the help of my friend Sam. It's a reverse engineering challenge, but with Python code instead of x86 assembly, which makes things much nicer.

data.tar.omgzip is a .tar file compressed using a custom compression program called omgzip. The Python source code for omgzip is provided, so all you need to do is reverse the logic of the program and write your own decompression program.

From the creator:  
"The original version of this challenge was pretty trivially solvable by ChatGPT, so I made it more difficult before its release and added a bunch of random comments and changed a bunch of variable names to make doing that take more time. We'll see if I was successful or not."

The source code is pretty funny to read through. All the comments are basically worthless, and the creator even makes use of confusing naming conventions and data types (i.e. `idx += True`) in order to throw off any kind of LLM trying to understand the code logic automatically. Regardless, any human with a decent amount of programming experience shouldn't be thrown off by this as long as they examine the logic of the code itself, it's not overly complicated.

Overall, the compression can be broken down into two steps. First, the compress() function is called, which looks for repeated concurrent bytes in the file and groups them together with a count. This can be reversed with some simple if/else logic, which I've done in uncompress_part1(). The second step calls the encode() method from a Deflator class on the file bytes, which is a bit more complicated.

To understand this second step, you first need to understand the data structure defined by the Family class. For those familiar with data structures, this is a [binary tree](https://www.geeksforgeeks.org/binary-tree-data-structure/) implementation. Each node contains an int of data and pointers to its parent and two children. This data structure is used by the Deflater class to map common bytes to shorter bit arrays, which I'll get into later.

When an object of the Deflater class is created, a complete binary tree of depth 8 is created and stored in self.money (see "[Types of binary trees](https://en.wikipedia.org/wiki/Binary_tree)"). Each node of the binary tree at depth 8 contains a number. Since the tree is 8 layers deep, there are 256 total nodes at the 8th layer, because 2^8 = 256. The nodes store incremental numbers from "right" to "left", starting with 0 in the rightmost node and ending with 255 in the leftmost. For purposes of visualizing the graph, I'm speaking as if the "successful_firstborn" child is on the right side of the parent, and the "conflicted_stepchild" child is on the left side. Pointers to each of these layer 8 nodes are also stored in self.dictionary, from right (at index "0") to left (at index "255").

In case your head is spinning, here's a visual aid:

![binary tree](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/bintree.jpg).

Luckily you wont have to reverse this setup step; setting up the binary tree will be exactly the same for decompression.

Moving on to the encode() method. This method runs _travesty() on each individual byte of the file. _travesty() plugs this byte into self.dictionary in order to get one of the binary tree nodes at layer 8. From this node, it then travels up the levels of the tree, writing a single bit of data for each layer travelled. If the child node is on the left side of the parent, a 1 is written, and if on the right, a 0 is written. The first time _travesty() is run, this simply writes the binary representation of the input byte, because of the way the tree was set up. Take 0x00 for example. The tree is 8 layers deep, and numbers are ordered from lowest to highest left -> right. 0x00 is on the farthest right node and is on the right side of every parent, so traversing the tree upwards produces 00000000. These bits are then added to the output array in big-endian format (most significant bit on the left), and then _magic() function is called on the starting layer 8 node before returning.

If the _magic() function wasn't called, each call to _travesty() would output the exact byte that was put in, as described above. However, _magic() performs a bit of scrambling on the binary tree on each pass, which makes things complicated. Put simply, _magic() switches the position of the input node with its aunt/uncle node, then does the same to that aunt/uncle's parent node until it reaches the root of the tree. Ultimately this puts the node at a higher layer in the tree, and also makes the tree no longer complete. Fortunately, you don't need to reverse this function, but it is important to understand, because this means our future bytes wont always map to themselves anymore, nor will they always map to 8 bits in the resulting file. If you do want a visual aid, though, I've got a rough drawing here:

![magic function](https://github.com/Fidget-Cube/write-ups/tree/main/2023/DEFCON_CTF_Qualifiers/OMGzip/magic.jpg)

So, that's it! The encode() method transforms each byte into an array of bits, which are combined and converted into bytes and returned. Once you understand the program, you can write your decompression algorithm.

In my solution, I copied over the entire Family and Deflater classes into my decompression script, since their functions can still be used for decompression (I did change some of the names to make more sense though). I added a new function, decode(), that starts by converting the entire file into a bit array, since that's the last step performed by encode(). I then wrote another new function, _tribute(), which, in combination with decode(), iterates over the entire bit array and recovers each byte one by one. Since _travesty() traverses the binary tree from bottom to top, _tribute() instead traverses it from top to bottom. The path it follows is determined by the bit array; if a 1 is encountered, it goes to the left child, if a 0, the right. Once it finds a node with no children, it can simply read the data inside the node to get the original byte used to encode the bits. If the decompression is done in order, starting from the beginning of the file, I can also run _magic() (renamed _scrambler) on the node that was found to update the binary tree the same way it was updated during compression. This process of using input bits to traverse the tree, then running _magic() each time we complete a byte, is looped over until we run out of input bits.

In total, to decompress the file data.tar.omgzip, you need to perform 3 steps. First, remove the OMGZIP header. Second, use your custom decode() function within the Deflater class to decode the bits of the file into their original bytes. Third and finally, use your reversed compress() function to expand the repeated bits of the file. And that's it! Write the bytes to data.tar, un-tar the archive, and get the flag from the "flag" file!

(Alternatively, just run decompressor.py on data.tar.omgzip. But that's just using my solution, and that's no fun right?)

Addendum:  
The implementation I wrote in Python is really slow, taking around 15-20 minutes to decompress the whole file. A faster implementation could be written in a faster language, like C++ or Rust. My friend [Sam](reference needed) helped a lot with the completion of this challenge and wrote his own implementation of the algorithm in Rust. You can find his solution [here](reference needed).

<!-- Categories:Reverse Engineering -->
