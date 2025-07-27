#include <stdio.h>
int main()
{
    int saque, saldo, qntd100, qntd50, qntd20, qntd10, cd100 = 0, cd50 = 0, cd20 = 0, cd10 = 0, resto, continuar, ideal, falta;
    continuar=1;
    printf("Configure quantas cédulas o caixa terá de R$100,00; R$50,00; R$20,00 e R$10,00: ");
    scanf("%d %d %d %d", &qntd100, &qntd50, &qntd20, &qntd10);
    printf("Digite o seu saldo: ");
    scanf("%d", &saldo);
    
    while(continuar==1){
    printf("Digite o saque desejado: ");
    scanf("%d", &saque);
    if ((saldo<saque)||(saque<0)){
        printf("Ops, algo deu errado!\nSaldo insuficiente.\n");
        goto fim;
    }
    resto = saque;
    // 100
    ideal = resto/100;
    cd100 = (ideal<=qntd100)?ideal:qntd100;
    falta = (ideal-cd100)*100;
    resto = (resto%100)+falta;
    // 50
    ideal = resto/50;
    cd50 = (ideal<=qntd50)?ideal:qntd50;
    falta = (ideal-cd50)*50;
    resto = (resto%50)+falta;
    // 20
    ideal = resto/20;
    cd20 = (ideal<=qntd20)?ideal:qntd20;
    falta = (ideal-cd20)*20;
    resto = (resto%20)+falta;
    // 10
    ideal = resto/10;
    cd10 = (ideal<=qntd10)?ideal:qntd10;
    resto = resto%10;

   if ((resto == 0) && (cd100*100 + cd50*50 + cd20*20 + cd10*10 == saque)) {
        printf("Saque concluído com sucesso!\nVocê recebeu: %d notas de R$100,00; %d notas de R$50,00; %d notas de R$20,00 e %d notas de R$10,00.\n", cd100, cd50, cd20, cd10);
        qntd100 = qntd100 - cd100;
        qntd50 = qntd50 - cd50;
        qntd20 = qntd20 - cd20;
        qntd10 = qntd10 - cd10;
        printf("Notas disponíveis:\n R$100,00 = %d.\nR$50,00 = %d.\nR$20,00 = %d.\nR$10,00 = %d.\n\n", qntd100, qntd50, qntd20, qntd10);
        saldo = saldo-saque;
        printf("Saldo atual: %d\n\n", saldo);
    }
    else{
        printf("Valor indisponível. Por favor, informe um valor válido de acordo com as cédulas disponíveis.\n");
    }
    fim:
    printf("Continuar sacando?\n1-> Sim. 2 -> Não.\n");
    scanf("%d", &continuar);
    }
    
return 0;
}