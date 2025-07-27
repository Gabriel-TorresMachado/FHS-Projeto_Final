qntd100 = int(input("Digite a quantidade de cédulas de R%100,00: "))
qntd50 = int(input("Digite a quantidade de cédulas de R%50,00: "))
qntd20 = int(input("Digite a quantidade de cédulas de R$20,00: "))
qntd10 = int(input("Digite a quantidade de cédulas de R$10,00: "))
saldo = int(input("Digite o seu saldo: "))
print(f"Dinheiro disponível para saque: {qntd100*100+qntd50*50+qntd20*20+qntd10*10}\n")
print(f"Seu saldo atual: {saldo}")

while True:
    saque = int(input("Digite o valor do saque: "))
    if saque > saldo or saque<0:
        print("Ops, algo deu errado!\nSaldo insuficiente.\n")
        continue
    resto = saque

    ideal = resto//100
    cd100 = ideal if ideal<=qntd100 else qntd100    #O mesmo que ? : em C. Se ideal for maior ou igual que a quantidade, o valor usado será o ideal, caso contrário, será todas as cédulas disponíveis.
    falta = (ideal-cd100)*100
    resto = (resto%100)+falta

    ideal = resto//50
    cd50 = ideal if ideal<=qntd50 else qntd50
    falta = (ideal-cd50)*50
    resto = (resto%50)+falta

    ideal = resto//20
    cd20 = ideal if ideal<=qntd20 else qntd20
    falta = (ideal-cd20)*20
    resto = (resto%20)+falta

    ideal = resto//10
    cd10 = ideal if ideal<=qntd10 else qntd10
    falta = (ideal-cd10)*10
    resto = (resto%10)+falta

    if ((resto == 0) and (cd100*100+cd50*50+cd20*20+cd10*10 == saque)):
        print(f"\nTransação concluída!\nVocê receberá {cd100} notas de R$100,00; {cd50} notas de R$50,00; {cd20} notas de R$20,00; {cd10} notas de R$10,00.")
        qntd100 = qntd100 - cd100
        qntd50 = qntd50 - cd50
        qntd20 = qntd20 - cd20
        qntd10 = qntd10 - cd10
        print(f"Cédulas disponíveis:\nR$100,00 = {qntd100}.\nR$50,00 = {qntd50}.\nR$20,00 = {qntd20}.\nR$10,00 = {qntd10}.\n")
        saldo=saldo-saque
        print(f"Dinheiro disponível para saque: {qntd100 * 100 + qntd50 * 50 + qntd20 * 20 + qntd10 * 10}\n")
        print(f"Saldo atual: {saldo}\n")
    else:
        print("Ops, algo deu errado!\nValor para saque inválido.\n")
    continuar = int(input("Continuar sacando? (1 para continuar)"))
    if continuar !=1:
            break   
