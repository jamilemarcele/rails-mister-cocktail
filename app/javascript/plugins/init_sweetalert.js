import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback = () => {}) => {
    const swalButton = document.querySelectorAll(selector);
    if (swalButton) { // protect other pages
        swalButton.forEach((swalAll) => {
            swalAll.addEventListener('click', () => {
                swal(options).then(callback);
            })
        });
    }
};

export { initSweetalert };
