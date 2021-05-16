SET SERVEROUTPUT ON;
--ex 1.1

PROMPT 'É preciso treinar para aprender';

--ex 1.6    

ACCEPT in_a NUMBER PROMPT 'Digite o primeiro valor';
ACCEPT in_x NUMBER PROMPT 'Digite o peso para o primeiro valor';
ACCEPT in_b NUMBER PROMPT 'Digite o segundo valor';
ACCEPT in_y NUMBER PROMPT 'Digite o peso para o segundo valor';
ACCEPT in_c NUMBER PROMPT 'Digite o terceiro valor';
ACCEPT in_z NUMBER PROMPT 'Digite o peso para o terceiro valor';

DECLARE
    mediaPonderada NUMBER;
BEGIN

    mediaPonderada := ((&in_x*&in_a)+(&in_y*&in_b)+(&in_z*&in_c))/(&in_x+&in_y+&in_z);  
    dbms_output.put_line(ROUND(mediaPonderada,2));
       
END;

--Exercicio 1.2
ACCEPT in_nome CHAR PROMPT 'QUAL É O SEU NOME?';
BEGIN
  dbms_output.put_line('SEU NOME É' ||' &in_nome');
END;

--ex 1.7
ACCEPT in_a NUMBER PROMPT 'Digite um valor inteiro';
BEGIN
    dbms_output.put_line('Anterior: '||( &in_a - 1));
    dbms_output.put_line('Posterior: '||( &in_a + 1));  
END;

--ex 1.8
ACCEPT in_nome CHAR PROMPT 'Digite o nome';
ACCEPT in_telefone NUMBER PROMPT 'Digite o telefone';
ACCEPT in_endereco CHAR PROMPT 'Digite o nome';


BEGIN
 
     dbms_output.put_line ( '&in_nome' );
     dbms_output.put_line ( &in_telefone );
     dbms_output.put_line ( '&in_endereco' );
 
  
END;


-- ex 1.9

ACCEPT in_a NUMBER PROMPT 'Digite o dividendo';
ACCEPT in_x NUMBER PROMPT 'Digite o divisor';

BEGIN
    dbms_output.put_line('Dividendo: '|| &in_a);
    dbms_output.put_line('Divisor: '|| &in_x);
    dbms_output.put_line('Quociente: '|| &in_a / &in_x);
    dbms_output.put_line('Resto: '||MOD(&in_a, &in_x));
END;

--ex 1.10

ACCEPT in_salario NUMBER PROMPT 'Digite Salário R$: ';
BEGIN
    dbms_output.put_line('Salário atualizado R$: '||(&in_salario * 1/100+ &in_salario));
END;

DECLARE
    salario NUMBER(10,2);
    aumento NUMBER(8,2);
BEGIN
    salario := 1024.53;
    aumento := salario * 1/100;
    dbms_output.put_line('Novo salario é R$: '||salario+aumento);
    
    
END;

ACCEPT in_a  NUMBER PROMPT 'Salario R$: ';
DECLARE
  a NUMBER;
BEGIN
  a:= &in_a ;
  dbms_output.put_line('Salário atualizado R$: '||(a * 1/100+ a));
END;

-- ex 1.11

ACCEPT in_a  NUMBER PROMPT 'Salario R$: ';
ACCEPT in_b NUMBER PROMPT 'Aumento de %: ';
DECLARE
  a NUMBER;
  b NUMBER;
BEGIN
  a:= &in_a ;
  b := &in_b;
  dbms_output.put_line('Salário atualizado R$: '||(a * b/100+ a));
END;

--ex 1.12

ACCEPT in_b NUMBER PROMPT 'Base: ';
ACCEPT in_a NUMBER PROMPT 'Altura: ';
DECLARE
    base NUMBER;
    altura NUMBER;
    diagonal NUMBER;
    area NUMBER;
BEGIN
    base:=&in_b;
    altura:=&in_a;
    diagonal := SQRT((base*base)+SQRT(altura));
    area := (base*altura)/2;
    dbms_output.put_line('A diagonal do triangulo mede: '||ROUND(diagonal,2));
    dbms_output.put_line('A area do triangulo mede: '||area);
        
END;

--ex 1.13

ACCEPT in_nome  CHAR PROMPT 'Digite um nome';

BEGIN
     dbms_output.put_line(SUBSTR('&in_nome',1,1));
     dbms_output.put_line(SUBSTR('&in_nome',-1,1)); 
     dbms_output.put_line(SUBSTR('&in_nome',1,3)); 
     dbms_output.put_line(SUBSTR('&in_nome',4,1));
     dbms_output.put_line(SUBSTR('&in_nome',1,4)); 
     
END;
    
--ex 1.14

ACCEPT in_b NUMBER PROMPT 'Base: ';
ACCEPT in_a NUMBER PROMPT 'Altura: ';
DECLARE
    base NUMBER;
    altura NUMBER;
    area NUMBER;
BEGIN
    base:=&in_b;
    altura:=&in_a;
    area := (base*altura)/2;
    dbms_output.put_line('A area do triangulo mede: '||area);
END;

--ex 1.15


ACCEPT in_b NUMBER PROMPT 'Base: ';
ACCEPT in_a NUMBER PROMPT 'Altura: ';
DECLARE
    base NUMBER;
    altura NUMBER;
    diagonal NUMBER;
BEGIN
    base:=&in_b;
    altura:=&in_a;
    diagonal := SQRT((base*base)+SQRT(altura));
    dbms_output.put_line('A hipotenusa do triangulo mede: '||ROUND(diagonal,2));
  
END;

--ex 1.16


ACCEPT in_a  NUMBER PROMPT 'Preço do produto R$: ';
DECLARE
  a NUMBER;
BEGIN
  a:= &in_a ;
  dbms_output.put_line('Preço com desconto R$: '||(a - (a * 9/100)));
END;

--ex 1.17


ACCEPT in_a  NUMBER PROMPT 'Temperatura em ºC: ';
DECLARE
  a NUMBER;
BEGIN
  a:= &in_a ;
  dbms_output.put_line('Temperatura em Fahrenheit: °F '||(9*a+160)/5);
END;

--ex 1.18

ACCEPT in_a  NUMBER PROMPT 'Angulo em graus: ';
DECLARE
    a FLOAT;
    seno FLOAT;
    cosseno FLOAT;
    tangente FLOAT;
    cossecante FLOAT;
    cotangente FLOAT;
    secante FLOAT;
    pi FLOAT;
  
BEGIN
    a:= &in_a ;
    pi := 3.14159;
    seno := SIN(a);
    cosseno:= COS(a);
    tangente:= TAN(a);
    cossecante:= 1/seno;
    cotangente:= 1/tangente;
    secante:= 1/cosseno;
    dbms_output.put_line('Seno: '||ROUND(pi*seno/180,3));
    dbms_output.put_line('Cosseno: '||ROUND(pi*cosseno/180,3));
    dbms_output.put_line('Tangente: '||ROUND(pi*tangente/180,3));
    dbms_output.put_line('Cossecante: '||ROUND(pi*cossecante/180,3));
    dbms_output.put_line('Cotangente: '||ROUND(pi*cotangente/180,3));
    dbms_output.put_line('Secante: '||ROUND(pi*secante/180,3));
 
END;

--exe 1.19

ACCEPT in_a  NUMBER PROMPT 'Digite numero para calculo de log na base 10: ';
DECLARE
  a NUMBER;
  
BEGIN
  a:= &in_a ;

  dbms_output.put_line('Resultado: '||LOG(a,10));
END;


--exe 1.20
ACCEPT in_a  NUMBER PROMPT 'Digite numero para calculo de log: ';
ACCEPT in_b  NUMBER PROMPT 'Digite numero para base do log: ';
DECLARE
  a NUMBER;
  b NUMBER;
  
BEGIN
  a:= &in_a ;
  B:= &in_b;

  dbms_output.put_line('Resultado: '||LOG(a,b));
END;

--ex 2.2

ACCEPT in_n NUMBER PROMPT 'INFORME O VALOR';

BEGIN
    IF &in_n >= 20 THEN
        dbms_output.put_line(&in_n+8);
    ELSE
        dbms_output.put_line(&in_n-5);
    END IF;

END;

--ex 2.3

ACCEPT in_n NUMBER PROMPT 'INFORME O VALOR';

BEGIN
    IF (MOD(&in_n,3)=0 ) THEN
        dbms_output.put_line('numero multiplo de 3');
    ELSE
        dbms_output.put_line('numero não é multiplo 3');
    END IF;

END;

-- ex 2.4
ACCEPT in_n NUMBER PROMPT 'INFORME O VALOR';

BEGIN
    IF (MOD(&in_n,3)=0 AND MOD(&in_n,7)=0 ) THEN
        dbms_output.put_line('numero multiplo de 3 e 7');
    ELSE
        dbms_output.put_line('numero não é multiplo ');
    END IF;

END;

--ex 2.5

ACCEPT in_sal NUMBER PROMPT 'INFORME O SALARIO: ';
ACCEPT in_parc NUMBER PROMPT 'INFORME O VALOR DA PARCELA: '
DECLARE
    a FLOAT;
    b FLOAT;
    x FLOAT;
BEGIN
    x:= a*0.3;
    IF (b > x ) THEN
        dbms_output.put_line('Emprestimo autorizado.');
    ELSE
        dbms_output.put_line('Emprestimo não autorizado.');
    END IF;
END;


--ex 2.6

ACCEPT sigla CHAR PROMPT 'INFORME A SIGLA DO SEU ESTADO: ';

DECLARE
    aux VARCHAR(2);
BEGIN
    aux := UPPER (SUBSTR('&sigla', LENGTH('&sigla')-1, 2));
     dbms_output.put_line(
        CASE
            WHEN aux = 'SP' OR aux='sp'
                THEN '&sigla'|| '  é Paulista'
            WHEN aux = 'RJ' OR aux='rj'
                THEN '&sigla'|| '  é Carioca'
             WHEN aux = 'ES' OR aux='es'
                THEN '&sigla'|| '  é Capixaba'
             WHEN aux = 'MG' OR aux='mg'
                THEN '&sigla'|| '  é  Mineiro'
             WHEN aux = 'BA' OR aux='ba'
                THEN '&sigla'|| '  é Baiano'
             WHEN aux = 'TO' OR aux='to'
                THEN '&sigla'||  ' é Tocantinense'
             WHEN aux = 'SE' OR aux='se'
                THEN '&sigla'|| '  é Sergipano'
            
            ELSE
                '&sigla'|| ' não catalogado'
        END
     );
     
END;

--ex 2.7
ACCEPT in_a NUMBER PROMPT 'nº1: ';
ACCEPT in_b NUMBER PROMPT 'nº2: ';
ACCEPT in_c NUMBER PROMPT 'nº3: ';
DECLARE
    a FLOAT;
    b FLOAT;
    c FLOAT;
BEGIN
    a:=&in_a;
    b:=&in_b;
    c:=&in_c;  
    IF (a>b AND b>c) THEN
        dbms_output.put_line(a , b, c);
    ELSIF (a>b AND c>b)THEN
        dbms_output.put_line(a, c, b);
    ELSIF (b>a AND a>c)THEN
        dbms_output.put_line(b, a, c);
    ELSIF (c>a AND a>b)THEN
        dbms_output.put_line(c, a, b);
    ELSIF (b>c AND c>a)THEN
        dbms_output.put_line(b, c, a);
    ELSIF (c>b AND b>a)THEN
        dbms_output.put_line(c, b, a);
    ELSE
        NULL;
    END IF; 

END;


    
    
--ex 2.8

ACCEPT sexo CHAR PROMPT 'Qual o sexo(M ou F)';
ACCEPT in_peso NUMBER PROMPT 'Informe o peso';

DECLARE
    aux VARCHAR2 (2);
    peso FLOAT;
    
BEGIN
    peso:= &in_peso;
    aux := SUBSTR('&sexo',   LENGTH('&sexo') -1, 1);
    IF aux = 'M' OR aux = 'm' THEN 
        dbms_output.put_line('Seu peso ideal: '||ROUND(peso*72.7 - 58,2));
    ELSIF aux = 'F' OR aux = 'f' THEN
        dbms_output.put_line('Seu peso ideal: '||ROUND(peso*62.1 - 44.7,2));
    ELSE
        NULL;
    END IF;

END;

--EX 2.10

PROMPT 'EQUAÇÃO DE SEGUNDO GRAU';
ACCEPT in_a NUMBER PROMPT 'Valor para a: ';
ACCEPT in_b NUMBER PROMPT 'Valor para b: ';
ACCEPT in_c NUMBER PROMPT 'Valor para c: ';
DECLARE
    a FLOAT;
    b FLOAT;
    c FLOAT;
    d FLOAT;
    x1 FLOAT;
    x2 FLOAT;
BEGIN
    a:= &in_a;
    b:= &in_b;
    c:= &in_c;
    IF (a=0 AND b!=0)THEN
        x1 := -c/b;
        dbms_output.put_line('Não é uma equação de 2º grau, sua raiz é: '||x1);
        IF(c = 0)THEN
             dbms_output.put_line('0 = 0');
        ELSE
            dbms_output.put_line('Não é possivel calcular pois existe uma contradição');
        END IF; 
    ELSE
        d := b*b-4*a*c;
        IF(d<0) THEN
             dbms_output.put_line('Não é possivel calcular a solução real');
        ELSE
            x1:= (-b + SQRT(d)/(2*a));
            x2:= (-b - SQRT(d)/(2*a));
            dbms_output.put_line('Raiz de x1: '||ROUND(x1,2));
            dbms_output.put_line('Raiz de x2: '||ROUND(x2,2));
            
        END IF;
        
    END IF;
      
END;

--EX 2.11
ACCEPT in_x NUMBER PROMPT 'INFORME UM NUMERO DE 1 A 12: ';

DECLARE
    aux NUMBER;
BEGIN
    aux :=&in_x;
     dbms_output.put_line(
        CASE
            WHEN aux = 1 
                THEN '&in_x ' || ' JANEIRO'
            WHEN aux = 2 
                THEN '&in_x '|| 'FEVEREIRO'
             WHEN aux = 3 
                THEN '&in_x '|| 'MARÇO'
             WHEN aux = 4
                THEN '&in_x '|| 'ABRIL'
             WHEN aux = 5
                THEN '&in_x '|| 'MAIO'
             WHEN aux = 6
                THEN '&in_x '||  'JUNHO'
             WHEN aux = 7
                THEN '&in_x '|| 'JULHO'
             WHEN aux = 8 
                THEN '&in_x '|| 'AGOSTO'
             WHEN aux = 9
                THEN '&in_x '|| 'SETEMBRO'
             WHEN aux = 10
                THEN '&in_x '|| 'OUTUBRO'
             WHEN aux = 11
                THEN '&in_x '||  'NOVEMBRO'
             WHEN aux = 12
                THEN '&in_x '|| 'DEZEMBRO'
            
            ELSE    
               NULL
        END
     );
     
END;

--ex 2.12

ACCEPT municipio CHAR PROMPT 'Qual o nome do municipio: ';
ACCEPT in_eleitores NUMBER PROMPT 'Informe o numero de eleitores aptos: ';
ACCEPT in_votos NUMBER PROMPT 'Informe o numero de votos do candidato mais votado ';

DECLARE
    aux VARCHAR2(10);
    eleitores NUMBER;
    votos NUMBER;
    
BEGIN
    votos:=&in_votos;
    aux := '&municipio';
    eleitores:= &in_eleitores;
    IF(eleitores < 20000)THEN
        dbms_output.put_line('Não há um numero suficiente de eleitores aptos em '||aux);
    ELSE
        IF(votos < eleitores/2)THEN
             dbms_output.put_line('Haverá segundo turno no municipio de '||aux);
        ELSE
             dbms_output.put_line('Não haverá segundo turno no municipio de '||aux);
        END IF;
    END IF;

END;

--ex 2.13

ACCEPT in_viagem NUMBER PROMPT 'A viagem em km: ';
ACCEPT in_carro CHAR PROMPT 'Qual modelo do carro: ';
DECLARE
    v NUMBER;
   carro VARCHAR(2);
   A NUMBER;
   B NUMBER;
   C NUMBER;
BEGIN
    A:= 12;
    B:= 9;
    C:= 8;
    v:=&in_viagem;
    carro:= '&in_carro';
    
    IF(carro = 'A' OR carro = 'a' )THEN
        dbms_output.put_line('Carro A consome: '||ROUND(v/A,2)||' Litros');
    ELSIF(carro = 'B' OR carro = 'b') THEN
        dbms_output.put_line('Carro B consome: '||ROUND(v/B,2)||' Litros');
    ELSE
        dbms_output.put_line('Carro C consome: '||ROUND(v/C,2)||' Litros');
    END IF;
    
END;
    

