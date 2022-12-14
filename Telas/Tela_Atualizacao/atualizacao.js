
function ValidaDados() {
  if (document.getElementById('codigo').value == '' 
      && document.getElementById('descricao').value == '' 
       ){
        alert('Por favor preencha todos os campos corretamente');  
        document.getElementById("codigo").style.border = "5px solid red";
        document.getElementById("descricao").style.border = "5px solid red";
      setTimeout(tiraBorda, 2000);}
  else {
    alert('Cadastro realizado com sucesso!');
  }
}     

function tiraBorda() {
  document.getElementById("codigo").style.border = "";
  document.getElementById("descricao").style.border = "";

}

