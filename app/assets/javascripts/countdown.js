<!--RoR Tutorial Ch.10, Ex.7-->

//<script type="text/javascript">
function LimitCharacters(txtMsg, CharLength, indicator) {
    chars = txtMsg.value.length;
    if (chars >= CharLength) {
    txtMsg.value = txtMsg.value.substring(0, CharLength);
    document.getElementById(indicator).innerHTML = 0;
    }
    else {
    document.getElementById(indicator).innerHTML = CharLength - chars;
    }
}
//</script>