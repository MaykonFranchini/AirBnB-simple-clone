import flatpickr from 'flatpickr'



const initFlatpickr = () => {
  const startDateInput = document.getElementById('booking_check_in');
  const endDateInput = document.getElementById('booking_check_out');
  flatpickr(startDateInput);
  flatpickr(endDateInput);
};

export { initFlatpickr }
