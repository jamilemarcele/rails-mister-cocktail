import Typed from 'typed.js';

const loadDynamicBannerText = () => {
    new Typed('#banner-typed-text', {
        strings: ["Somewhere in the world it's happy hour!", "Happy hour is the best hour!"],
        typeSpeed: 70,
        loop: true
    });
}

export { loadDynamicBannerText };
