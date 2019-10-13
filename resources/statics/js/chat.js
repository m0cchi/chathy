(function(){
    let chatForm;
    let chatSubmitButton;
    document.addEventListener('DOMContentLoaded', init, false);
    
    function init(){
	chatForm = document.getElementById('chatForm');
	chatSubmitButton = document.getElementById('chatSubmitButton');
	chatSubmitButton.onclick = submit;
    }

    function submit(){
	const formData = new FormData(chatForm);
	const req = new XMLHttpRequest();
	req.open('POST', '/api/message');
	req.send(formData);
    }
    
})();
