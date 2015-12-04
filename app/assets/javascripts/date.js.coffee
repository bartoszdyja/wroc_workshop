$(document).ready ->
  $('.date_picker').datepicker(
      setDate: null,
      startView: 2,
      autoclose: true,
      format: 'dd/mm/yyyy',
      defaultViewDate: { year: 1960}
      )
