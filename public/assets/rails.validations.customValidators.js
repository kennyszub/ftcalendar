window.ClientSideValidations.validators.local.starts_at=function(t,a){return/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(t.val())?(start_date=new Date($("#milestone_start_date").val()),end_date=new Date($("#milestone_end_date").val()),start_date>end_date?a.message:void 0):a.message};