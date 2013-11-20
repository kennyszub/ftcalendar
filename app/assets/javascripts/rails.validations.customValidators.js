// The validator variable is a JSON Object
// The selector variable is a jQuery Object
window.ClientSideValidations.validators.local['starts_at'] = function(element, options) {
    // Your validator code goes in here
    if (!/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(element.val())) {
        // When the value fails to pass validation you need to return the error message.
        // It can be derived from validator.message
        return options.message;
    }

    start_date = new Date($('#milestone_start_date').val());
    end_date = new Date($('#milestone_end_date').val());
    if(end_date < start_date) {
        return options.message;
    }
}