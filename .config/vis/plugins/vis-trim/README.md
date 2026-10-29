# vis-trim

## About

This plugin will remove trailing whitespaces on save.

## How to use

Clone this repository into a location that your visrc can
see and import it there.

## Warning

This plugin has not been thoroughly and rigorously tested.
It uses the file:delete and file:insert operations to
update the file buffer on save. I cannot reliably predict
the behaviour of these operations. Following the logic of
the code, it should restore the buffer if either file:delete
or file:insert should fail. In theory, this should be a safe
implementation. As I have not tested this thoroughly and
rigorously, I cannot guarantee the behaviour of this script.
**Do not use this plugin yet** until it is fully tested. I
am only publishing this on GitHub for me to be able to
clone it on other machines and incase someone might want to
review the code and give me suggestions. I am new to lua and
also to the vis text editor.
