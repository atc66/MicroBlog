var pw = document.getElementById('pw')
var button = document.getElementById('button')
var user = document.getElementById('user')
var message = document.getElementById('message')


button.addEventListener('click', function(){
	if (user.value.length < 14 && pw.value === '12345678')  {
		message.innerHTML = 'Congrats on knowing your username and password!'
	}	else {
			alert('Incorrect username or password')
		}
})