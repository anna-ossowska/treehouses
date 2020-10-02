import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
   // flatpickr("#range_start", {
     // altInput: true,
     // plugins: [new rangePlugin({ input: "#range_end"})]
   // });
  toggleDateInputs();
});

const toggleDateInputs = function() {
  const startDateInput = document.getElementById('range_start');
  const endDateInput = document.getElementById('range_end');
  console.log(startDateInput, endDateInput);
  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('#widget-content').dataset.unavailable)
    console.log(unvailableDates);
    flatpickr(startDateInput, {
      minDate: 'today',
      dateFormat: 'Y-m-d',
      disable: unvailableDates,
      plugins: [new rangePlugin({ input: "#range_end"})],
      onChange: function(selectedDates, selectedDate) {
        if (selectedDate === '') {
          endDateInput.disabled = true;
        }
        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate());
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
    // const endDateCalendar =
    // flatpickr(endDateInput, {
      // dateFormat: 'Y-m-d',
      // disable: unvailableDates,
    // });
  }
};






export { toggleDateInputs }
