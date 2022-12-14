class Validator{

    constructor(){
        this.validationState = true; //se nao tem erro

        this.validations = [
            'data-required',
            'data-min-length',
            'data-only-letters',
            'data-only-length',
            'data-email-validate',
            'data-equal',
            'data-password-validate',
        ]
    }

    //iniciar validação de todos os campos
    validate(form){

        //resgatar todas as validações   (currentValidations são as validações)
        let currentValidations = document.querySelectorAll('.error-validation');
        //document.getElementById('register-form');
        //document.querySelectorAll('form .error-validation');

        if(currentValidations.length > 0){
            this.cleanValidations(currentValidations);
        }

        //pegar os inputs
        let inputs = form.getElementsByTagName('input');

        //transformo htmlcollection -> array
        let inputsArray = [...inputs];

        // loop nos inputs e validação do que for encontrado
        inputsArray.forEach(function(input) {
       

            //loop em todas as validações
            for(let i = 0; this.validations.length > i; i++) {
                //verifica se a validação existe no input
                if(input.getAttribute(this.validations[i]) != null) {
 
                    //limpar string para virar método
                    let method = this.validations[i].replace('data-', '').replace('-', '');

                    //valor do input
                    let value = input.getAttribute(this.validations[i]);

                    //chamar metodo
                    this[method](input, value);
            
                }
            }
        }, this);
    }

    //verifica se um input(nome) tem apenas letras
    onlyletters(input, letters) {
        const rx = new RegExp(letters);
        let errorMessage = 'O campo só aceita letras';
        if(!(rx.test(input.value))) {
            this.printMessage(input, errorMessage);
        }
    }

    //verifica se um input(cpf) tem o valor de caracteres exigido
    onlylength(input, Value){
        let inputLength = input.value.length;
        
        let errorMessage = 'O campo precisa ter 11 caracteres, sendo esses apenas números';
         
        if(inputLength != Value || !(/^[0-9]+$/.test(input.value))) {
           this.printMessage(input, errorMessage);
        }
    }

    //verifica se um input(email) é valido
    emailvalidate(input) {
        //validação de email(email@---.com)
        let re = /\S+@\S+\.\S+/; 

        let email = input.value;

        let errorMessage = 'Modelo de email inválido';

        if(!re.test(email)){
            this.printMessage(input, errorMessage);
        }
    }

    //verifica se dois campos sao iguais (confirmar senha e senha)
    equal(input, inputName) {
         let inputToCompare = document.getElementsByName(inputName)[0];

         let errorMessage = 'Este campo precisa estar igual ao campo Senha';

         if(input.value != inputToCompare.value) {
            this.printMessage(input, errorMessage);
         }

    }

    //valida o campo de senha
    passwordvalidate(input) {

        //transformar string em array
        let charArr = input.value.split("");

        let uppercases = 0;  //contador de letra maiuscula
        let numbers = 0;  //contador de numeros

        for(let i = 0; charArr.length > i; i++) {
            if(charArr[i] === charArr[i].toUpperCase() && isNaN(parseInt(charArr[i]))) {
            uppercases++;
            } else if(!isNaN(parseInt(charArr[i]))) {
                numbers++;
            }
        }

        if(uppercases === 0 || numbers === 0) {
            let errorMessage = 'A senha deve conter pelo menos um número e uma letra maiúscula';
            this.printMessage(input, errorMessage);
        }
    }

    //verifica se um input(senha) tem um valor minimo de caracteres
    minlength(input, minValue) {
        let inputLength = input.value.length;
        
        let errorMessage = 'O campo precisa ter pelo menos 8 caracteres';
         
        if(inputLength < minValue) {
           this.printMessage(input, errorMessage);
        }
    }

    //verifica se o input é requerido
    required(input){

        let inputValue = input.value;

        if(inputValue === ''){
            let errorMessage = 'Este campo é obrigatório';

            this.printMessage(input, errorMessage);
        }
    }

    //metodo para imprimir mensagem de erro na tela
    printMessage(input, msg) {

        this.validationState = false;

        //quantidade de erros
        let errorsQty = input.parentNode.querySelector('.error-validation');

        //so entra no if se já nao tiver nenhum erro antes
        if(errorsQty === null) {

        let template = document.querySelector('.error-validation').cloneNode(true);

        template.textContent = msg;

        let inputParent = input.parentNode;

        template.classList.remove('template');

        inputParent.appendChild(template);
        }
    }   
    
    //limpar as validações da tela
    cleanValidations(validations){
        validations.forEach(el =>el.value = '');  //el = elemento
    }
}

let form = document.getElementById("register-form");
let submit = document.getElementById("btn-submit");

let validator = new Validator();
//evento para disparar as validações
 submit.addEventListener('click', function(e) {
    e.preventDefault();
    validator.validate(form);

//alerta de conta criada 
    const checkbox = document.getElementById('agreement');

    if(validator.validationState && checkbox.checked){
      alert('Seus dados foram guardados com sucesso!');
      window.location.replace('login.html');
    }
});