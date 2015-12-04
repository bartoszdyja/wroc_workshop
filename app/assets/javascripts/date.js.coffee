$(document).ready ->
  $('.date_picker').datepicker(
      setDate: null,
      startView: 2,
      orientation: "bottom left",
      autoclose: true,
      format: 'dd/mm/yyyy',
      defaultViewDate: { year: 1960}
      )
