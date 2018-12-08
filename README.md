# Wine-Analysis

a. Como foi a definição da sua estratégia de modelagem?

Separei em 6 etapas:
	1. Revisão bibliográfica e definição de escopo: (Cada vinho será tratado separadamente, branco e tinto)
	2. Análise exploratória univariada
	3. Análise exploratória bivariada
	4. Remoção de colinearidade (PCA)
	5. Regressão linear multivariada, seleção de variáveis
	6. Validação cruzada com repetição
	7. Classificação com Análise de Discriminante Linear
	8. Próximos passos

b. Como foi definida a função de custo utilizada?
	Para medir acurácia utilizou-se MAE (Mean absolute error) para regressão e precision e recall para classificação

c. Qual foi o critério utilizado na seleção do modelo final?
	Simplicidade de análise. Primeiro quis construir um modelo que me ajuda-se a entender o impacto de cada variável na classificação de qualidade.
E em estudos futuros posso iterar o modelo ou comparar com outros modelos.

d. Qual foi o critério utilizado para validação do modelo? 
	1. 70% dos dados foram separados para treinamento e utilizados em modelos de regressão e classificação.
	2. A seleção aleatória foi estratificada por cada classe de qualidade para garantir mesma distribuição em diferentes classes.
	3. O modelo final é testado nos 30% restantes e é esperado que sua performance fique dentro da margem de erro obtida no treinamento, esse 
	procedimento reduz drasticamente o risco de enviesar o modelo (overfitting).

Por que escolheu utilizar este método?
	Facilidade de visualização e interpretação. Para o primeiro modelo é essencial que seja fácil de implementar e interpretar.

e. Quais evidências você possui de que seu modelo é suficientemente bom?
	1. Referências bibliográficas garantem que o resultado é compatível com a literatura. 
	2. As medidas de desvio médio absoluto e fração da regressão dentro de diferentes margens de tolerãncia,
	fazem a conexão com parâmetros do negócio, tolerância usual em padrões de qualidade (inter-rater reliability). 
	3. Esses parâmetros de sucesso são fácilmente traduzidos em critérios de aceite para aplicações de negócio.
	4. O sucesso absoluto depende do contexto da aplicação do modelo, o mais importante é ter uma métrica de fácil compreensão.

	O modelo é bom para comparação com outros modelos. Tem a mesma performance de modelos similares na literatura. Mas sua performance é pior se comparado com outros 
modelos como SVM ou FIR. Em próximas iterações a intenção é aplicar ambos métodos e buscar oportunidades de melhorias na engenharia das variáveis ou hyperparâmetros do modelo.
