// Code snippet taken from https://css-tricks.com/lets-create-a-custom-audio-player/

const playIconContainer = document.getElementById('play-icon');
const audioPlayerContainer = document.getElementById('audioplayer-container');
const muteIconContainer = document.getElementById('mute-icon');
const audio = document.querySelector('audio');
const durationContainer = document.getElementById('duration');
const seekSlider = document.getElementById('seek-slider');
const volumeSlider = document.getElementById('volume-slider');
const currentTimeContainer = document.getElementById('current-time');
const volumeOutputContainer = document.getElementById('volume-output');

// Calculate Time Values
const calculateTime = (secs) => {
    const minutes = Math.floor(secs / 60);
    const seconds = Math.floor(secs % 60);
    const formattedSeconds = seconds < 10 ? `0${seconds}` : `${seconds}`;
    if (minutes > 59) {
        const hours = Math.floor(minutes / 60);
        const minutes = Math.floor(minutes % 60);
        const formattedMinutes = minutes < 10 ? `0${minutes}` : `${minutes}`;
        return `${hours}:${formattedMinutes}:${formattedSeconds}`;
    } else {
        return `${minutes}:${formattedSeconds}`;
    }
}


// Play and Mute buttons
let playState = 'play';
let muteState = 'unmute';

const playAnimation = bodymovin.loadAnimation({
    container: playIconContainer,
    path: 'https://maxst.icons8.com/vue-static/landings/animated-icons/icons/pause/pause.json',
    renderer: 'svg',
    loop: false,
    autoplay: false,
    name: "Play Animation",
});

const muteAnimation = bodymovin.loadAnimation({
    container: muteIconContainer,
    path: 'https://maxst.icons8.com/vue-static/landings/animated-icons/icons/mute/mute.json',
    renderer: 'svg',
    loop: false,
    autoplay: false,
    name: "Mute Animation",
});

playAnimation.goToAndStop(14, true);

let rAF = null;

const whilePlaying = () => {
    seekSlider.value = Math.floor(audio.currentTime);
    currentTimeContainer.textContent = calculateTime(seekSlider.value);
    audioPlayerContainer.style.setProperty('--seek-before-width', `${(seekSlider.value / seekSlider.max) * 100}%`);
    rAF = requestAnimationFrame(whilePlaying);
  }

playIconContainer.addEventListener('click', () => {
  if(playState === 'play') {
    audio.play();
    playAnimation.playSegments([14, 27], true);
    requestAnimationFrame(whilePlaying);
    playState = 'pause';
  } else {
    audio.pause();
    playAnimation.playSegments([0, 14], true);
    cancelAnimationFrame(rAF);
    playState = 'play';
  }
});

muteIconContainer.addEventListener('click', () => {
    if(muteState === 'unmute') {
        muteAnimation.playSegments([0, 15], true);
        audio.muted = true;
        muteState = 'mute';
    } else {
        muteAnimation.playSegments([15, 25], true);
        audio.muted = false;
        muteState = 'unmute';
    }
});

// Audio loading logic

const displayBufferedAmount = () => {
    const bufferedAmount = audio.buffered.length > 0 ? Math.floor(audio.buffered.end(audio.buffered.length - 1)) : 0;
    audioPlayerContainer.style.setProperty('--buffered-width', `${(bufferedAmount / seekSlider.max) * 100}%`);
}

const setSliderMax = (secs) => {
    seekSlider.max = Math.floor(secs);
}

if (audio.readyState > 0) {
    durationContainer.textContent = calculateTime(audio.duration);
    setSliderMax(audio.duration);
    displayBufferedAmount();
} else {
    audio.addEventListener('loadedmetadata', () => {
        durationContainer.textContent = calculateTime(audio.duration);
        setSliderMax(audio.duration);
        displayBufferedAmount();
    });
}

seekSlider.addEventListener('input', (e) => {
    audioPlayerContainer.style.setProperty('--seek-before-width', `${(e.target.value / e.target.max) * 100}%`);
});
volumeSlider.addEventListener('input', (e) => {
    audioPlayerContainer.style.setProperty('--volume-before-width', `${(e.target.value / e.target.max) * 100}%`);
})

seekSlider.addEventListener('input', () => {
    currentTimeContainer.textContent = calculateTime(seekSlider.value);
    if (!audio.paused) {
        cancelAnimationFrame(rAF);
    }
});
seekSlider.addEventListener('change', () => {
    audio.currentTime = seekSlider.value;
    if (!audio.paused) {
        requestAnimationFrame(whilePlaying);
    }
});
volumeSlider.addEventListener('input', (e) => {
    volumeOutputContainer.textContent = e.target.value;
    audio.volume = e.target.value / 100;
});
audio.addEventListener('progress', displayBufferedAmount)
