# 📊 Atrasos na Entrega e Satisfação do Cliente no E-commerce Brasileiro (Olist)

> Análise de como os atrasos na entrega afetam a avaliação dos clientes no marketplace Olist e de quais fatores (região, vendedor, categoria, frete) estão associados a esses atrasos.

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?logo=powerbi&logoColor=black)

> 🚧 **Status do projeto:** Etapa 0 concluída (definição da pergunta de negócio). Próxima etapa: coleta e compreensão dos dados no PostgreSQL.

---

## 🎯 Principais resultados

_A preencher após a conclusão da análise (EDA e dashboard)._

- **[Resultado 1]:** _pendente_
- **[Resultado 2]:** _pendente_
- **[Resultado 3]:** _pendente_
- **[Insight adicional]:** _pendente_

<!-- ![Descrição do gráfico](images/nome_do_grafico.png) -->

---

## 💼 Recomendações

_A preencher após a conclusão da análise. Só serão incluídas recomendações sustentadas pelos dados._

1. **[Recomendação 1]:** _pendente_
2. **[Recomendação 2]:** _pendente_
3. **[Recomendação 3]:** _pendente_

---

## ❓ Pergunta de negócio

> **Como os atrasos na entrega impactam a satisfação dos clientes (nota de avaliação) e quais fatores estão associados à ocorrência desses atrasos?**

**Por que importa:** Em marketplaces, a entrega é a etapa que a plataforma menos controla diretamente, pois depende de vendedores e transportadoras, mas é uma das que mais influenciam a experiência do cliente. Avaliações ruins afetam a reputação de vendedores e da plataforma, a conversão de novos pedidos e a recompra. Entender quanto o atraso pesa na nota e onde ele se concentra permite priorizar ações de logística, seleção de vendedores e ajuste do prazo prometido.

**Hipótese inicial:**
- H1: Pedidos entregues após a data estimada têm notas de avaliação significativamente menores do que pedidos entregues no prazo.
- H2: Os atrasos se concentram em regiões mais distantes dos vendedores (ex.: Norte e Nordeste), em determinados vendedores e em categorias específicas.

**Hipótese confirmada?** _Pendente (a ser respondida após a EDA)._

---

## 🛠️ Ferramentas

| Etapa | Ferramentas |
|---|---|
| Coleta e compreensão dos dados | PostgreSQL |
| Limpeza e preparação | Python (pandas) |
| Análise exploratória (EDA) | Python (pandas, matplotlib, seaborn, scipy) |
| Visualização | Power BI |

---

## 📊 Dados

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Período:** aproximadamente set/2016 a out/2018 (volume concentrado em 2017–2018) _(a confirmar na etapa de exploração)_
- **Abrangência:** pedidos de marketplace em todo o Brasil, com cerca de 100 mil pedidos, de vendedores e clientes de diversos estados
- **Dados utilizados:** tabelas relacionais do dataset _(escopo final a confirmar na etapa de exploração)_:
  - `olist_orders_dataset`: status e datas do pedido (compra, aprovação, envio, entrega, estimativa)
  - `olist_order_items_dataset`: itens, preço, frete e vendedor
  - `olist_order_reviews_dataset`: nota (1–5) e comentários
  - `olist_customers_dataset`: localização do cliente
  - `olist_sellers_dataset`: localização do vendedor
  - `olist_products_dataset` e `product_category_name_translation`: categorias
  - `olist_order_payments_dataset` e `olist_geolocation_dataset`: avaliar necessidade
- **Acesso:** baixar o dataset no Kaggle e colocar os CSVs em `data/raw/` (não versionados).
- **Observações:** dataset público e anonimizado; verifique a licença na página do Kaggle antes de redistribuir os dados.

### Definições de métricas

_Definições preliminares, a serem validadas após a exploração dos dados._

| Métrica | Definição |
|---|---|
| Pedido atrasado | Pedido com status `delivered` cuja data de entrega ao cliente é posterior à data estimada de entrega |
| Dias de atraso | Diferença em dias entre a data real de entrega e a estimada (considerada apenas para pedidos atrasados) |
| Taxa de atraso | Pedidos atrasados ÷ pedidos entregues |
| Tempo de entrega | Dias entre a data de compra e a data de entrega ao cliente |
| Nota média de avaliação | Média do `review_score` (1 a 5) por grupo analisado |
| Frete relativo | Valor do frete ÷ valor do pedido |

---

## 🔍 Metodologia

_Planejamento inicial. Será atualizado conforme cada etapa for executada._

1. **Coleta:** _(a executar)_ Carga dos CSVs do Kaggle em um banco PostgreSQL, com definição de schema, chaves e tipos.
2. **Exploração inicial:** _(a executar)_ Verificação de volumes, integridade referencial, nulos, duplicidades e status dos pedidos via SQL.
3. **Limpeza e preparação:** _(a executar)_ Tratamento de tipos, datas, nulos, duplicidades (ex.: múltiplas avaliações por pedido) e criação de variáveis (atraso, tempo de entrega, região).
4. **Análise:** _(a executar)_ EDA, relação entre atraso e nota, comparações por região, categoria e vendedor, e testes estatísticos.
5. **Visualização:** _(a executar)_ Dashboard no Power BI.
6. **Validação:** _(a executar)_ Conferência cruzada de totais entre SQL, Python e Power BI.

---

## ⚠️ Limitações e próximos passos

**Limitações**

- Dataset é uma amostra histórica (2016–2018) e anonimizada, então pode não refletir a operação atual.
- A análise mostra associação, não causalidade: outros fatores (qualidade do produto, expectativa do cliente) também afetam a nota.
- A nota de avaliação é autodeclarada e há viés de resposta (nem todo cliente avalia).

_Demais limitações e próximos passos serão registrados ao final do projeto._

---

## 📁 Estrutura do repositório

```text
├── data/
│   ├── raw/          # CSVs originais do Kaggle (não versionados)
│   └── processed/    # Dados tratados
├── sql/              # Scripts de criação de schema, carga e consultas
├── notebooks/        # Notebooks de limpeza e EDA
├── src/              # Scripts Python reutilizáveis
├── powerbi/          # Arquivo .pbix e documentação do dashboard
├── images/           # Gráficos usados no README
├── requirements.txt
└── README.md
```

_Estrutura planejada; será ajustada conforme os arquivos reais do projeto._

## ▶️ Como reproduzir

_A preencher após a conclusão das etapas de coleta e tratamento._

---

## 👤 Autor

**[Seu nome]**: [LinkedIn](https://linkedin.com/in/seu-perfil) · [GitHub](https://github.com/seu-usuario)
