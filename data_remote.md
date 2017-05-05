#Rails form_for&form_tag
##if you set a form by form_for or form_tag,it just submit by nomal way,but if you add "data_remote:true",it will submit by ajax
##why?
##because of "jquery-ujs"
##if you add "data_remote:true",it will add attribute of "data_remote" on your html code,ujs judges if the attribute exists,then it will choose submit the form by nomal way or ajax
