// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap';

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initSelect2 } from '../plugins/init_select2';


//JS for the home page banner
document.addEventListener('turbolinks:load', () => {
    // Call your JS functions here
    loadDynamicBannerText();
});

//JS for transparent and white banner
document.addEventListener('turbolinks:load', () => {
    initUpdateNavbarOnScroll();
});

// JS select2 form
document.addEventListener("turbolinks:load", function() {
    initSelect2();
});

// JS Sweet Alert for delete message
document.addEventListener("turbolinks:load", function() {
    initSweetalert('#sweet-alert', {
        title: "Are you sure? 🤔",
        text: "Once deleted, you will not be able to recover it!",
        icon: "warning",
        buttons: true,
        dangerMode: true,
        closeOnClickOutside: false,
    }, (value) => {
            if (value) {
                const link = document.querySelector('#delete-link');
                link.click();
            }
        });
});
