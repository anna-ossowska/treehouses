import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  flatpickr(".datepicker", {});
  flatpickr("#range_start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
});
});


