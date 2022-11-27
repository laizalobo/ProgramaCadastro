Program Cadastro ;

Type 
  cadastro = Record
    nome: string;
    sobrenome: string;
    cpf: string;
    senha: string;
  End;
Const
	MAX = 5;
Var 
  registro: array [1..MAX] Of cadastro;
  opcao: integer;

// Mostra a posição e o nome das pessoas cadastradas
Procedure mostrarPessoas();

Var i: integer;
Begin
  For i := 1 To MAX Do
    Begin
    	if (registro[i].nome = '') then
    	  writeln('Posição: ', i, ' - registro apagado')
    	else
      	writeln('Posição: ', i, ' - ', registro[i].nome, ' ', registro[i].sobrenome);
    End;
  writeln;
End;
    
// Faz o cadastro de todas as pessoas através de um for
Procedure realizarCadastro();

Var i: integer;
Begin
	clrscr;
  For i := 1 To MAX Do
    Begin
      writeln('Informe o nome: ', i, ': ');
      readln(registro[i].nome);
      writeln('Informe o sobrenome: ', i, ': ');
      readln(registro[i].sobrenome);
      writeln('Informe o cpf: ', i, ': ');
      readln(registro[i].cpf);
      writeln('Informe a senha: ', i, ': ');
      readln(registro[i].senha);
      clrscr;
    End;
  
    writeln('*** Cadastro realizado com sucesso! ***');  
    writeln;
    mostrarPessoas();
End;



// Pede a posição de uma pessoa para realizar a alteração
Procedure alterarCadastro();

Var 
  posicao: integer;
Begin
  posicao := 0;
  clrscr;
	mostrarPessoas();  //Chamando a procedure
  
  writeln('Informe a posiçao do usuário que deseja alterar: ');        
  readln(posicao);

  writeln('Informe o novo nome: ');
  readln(registro[posicao].nome);
  writeln('Informe o novo sobrenome: ');
  readln(registro[posicao].sobrenome);
  writeln('Informe o novo cpf: ');
  readln(registro[posicao].cpf);
  writeln('Informe uma nova senha: ');
  readln(registro[posicao].senha);
  clrscr;
  writeln('*** Cadastro alterado com sucesso! ***');
  writeln('Posição: ', posicao, ' - ', registro[posicao].nome, ' ', registro[posicao].sobrenome);
  writeln;
End;
													
// Pede uma posição para apagar as informações de uma pessoa													
Procedure apagarCadastro();

Var 
  posicao: integer;
Begin
  posicao := 0;
  clrscr;
  mostrarPessoas();

  writeln('Informe a posição do usuário que deseja apagar: ');
  read(posicao);
  registro[posicao].nome := '';
  registro[posicao].sobrenome := '';
  registro[posicao].cpf := '';
  registro[posicao].senha := '';
  clrscr;
  writeln('*** Cadastro apagado! ***')
End;

// Pede a posição de uma pessoa para abrir a porta, retorna uma string informado se a pessoa pode abrir a porta
Function liberarEntrada(): string;

Var 
  posicao: integer;
  senha: string;
  tentativas: integer;

Begin
  posicao := 0;
  tentativas := 0;
  senha := '';
  
  clrscr;
	mostrarPessoas();
  
	writeln('Informe a posição do usuário que irá abrir a porta: ');
  read(posicao);
  
  
	while tentativas < 3 do
		begin
			writeln('Informe a senha: ');
  		read(senha);
			
  		If (senha = registro[posicao].senha) Then
  			begin
    			liberarEntrada := registro[posicao].nome + ', seu acesso está liberado!';
    			tentativas := 3;
    			
    		end
  		Else
  			begin			
    			tentativas := tentativas + 1;
    			writeln('Senha incorreta');
    			writeln('Você possui mais ', 3 - tentativas, ' tentativas');
    			writeln;
    			liberarEntrada := registro[posicao].nome + ', seu acesso não foi liberado!';
    		end;
    end;
  clrscr;
End;

// Programa principal
Begin
  opcao := -1;
  While opcao <> 0 Do
    Begin
    	writeln('**** Residência dos Lobo ****');
    	writeln;
      writeln('Escolha uma opção: ');
      writeln('1 - Cadastrar pessoas');
      writeln('2 - Alterar um cadastro');
      writeln('3 - Apagar um cadastro');
      writeln('4 - Abrir fechadura');
      writeln('0 - Para encerrar');
      read(opcao);

      Case (opcao) Of 
        1: realizarCadastro();
        2: alterarCadastro();
        3: apagarCadastro();
        4: writeln(liberarEntrada());
      End;

			writeln();
    End;
End.
