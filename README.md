# 📊 Entrega e Satisfação do Cliente no E-commerce Brasileiro (Olist)

> Análise de como o desempenho logístico (atrasos e prazos de entrega) afeta a satisfação dos clientes no marketplace Olist, identificando onde os problemas se concentram (regiões, categorias e vendedores).

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?logo=powerbi&logoColor=black)

> 🚧 **Status do projeto:** Etapa 0 concluída (pergunta de negócio). Etapa 1 (Coleta e Compreensão dos dados, PostgreSQL) com scripts e notebook prontos, **aguardando execução com os dados reais**. Próxima: Limpeza e Preparação (Python).

---

## 🎯 Principais resultados

<!-- Preencher após concluir a análise. Incluir apenas resultados sustentados pelos dados. -->

- **[Resultado 1]:** _a preencher_
- **[Resultado 2]:** _a preencher_
- **[Resultado 3]:** _a preencher_
- **[Insight adicional]:** _a preencher_

<!-- ![Descrição do gráfico](images/nome_do_grafico.png) -->

---

## 💼 Recomendações

<!-- Preencher após os resultados. Evitar recomendações não sustentadas pela análise. -->

1. **[Recomendação 1]:** _a preencher_
2. **[Recomendação 2]:** _a preencher_
3. **[Recomendação 3]:** _a preencher_

---

## ❓ Pergunta de negócio

> **Atrasos na entrega e prazos longos reduzem a satisfação dos clientes (nota de avaliação)? E em quais regiões, categorias de produto e vendedores esses problemas se concentram?**

**Por que importa:** Em um marketplace, a experiência de entrega depende de vários atores (vendedor, transportadora e plataforma) e influencia diretamente a avaliação do cliente, a reputação dos vendedores e a chance de recompra. Entender *quanto* a logística pesa na satisfação, e *onde* ela falha, permite priorizar ações de maior impacto (renegociar prazos, acompanhar vendedores críticos, ajustar a promessa de entrega por região).

**Hipótese inicial:** Pedidos entregues após a data estimada têm notas significativamente menores do que os entregues no prazo, e o efeito é mais forte em regiões distantes dos centros de distribuição (ex.: Norte e Nordeste) e em categorias com maior dependência de frete.

**Hipótese confirmada?** _A definir após a EDA (Sim / Parcialmente / Não)._

---

## 🛠️ Ferramentas

| Etapa | Ferramentas |
|---|---|
| Coleta e Compreensão dos dados | PostgreSQL |
| Limpeza e Preparação dos dados | Python (Jupyter Notebook) |
| Análise Exploratória de Dados (EDA) | Python (Jupyter Notebook) |
| Visualização dos Dados | Power BI |

---

## 📊 Dados

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Período:** _a confirmar na etapa de compreensão dos dados (datas mínima e máxima de `order_purchase_timestamp`)_
- **Abrangência:** Pedidos realizados no marketplace Olist em todo o Brasil, com dados de clientes, vendedores, produtos, pagamentos e avaliações
- **Dados utilizados:** 9 tabelas CSV (relacionadas por chaves):
  - `olist_orders_dataset`
  - `olist_order_items_dataset`
  - `olist_order_payments_dataset`
  - `olist_order_reviews_dataset`
  - `olist_customers_dataset`
  - `olist_sellers_dataset`
  - `olist_products_dataset`
  - `olist_geolocation_dataset`
  - `product_category_name_translation`
- **Acesso:** Baixar o dataset na página do Kaggle e salvar os CSVs em `data/raw/` (não versionados no repositório).
- **Observações:** Dados anonimizados pela Olist. Conferir licença e termos de uso na página do dataset no Kaggle.

### Definições de métricas

> Definições preliminares, sujeitas a ajuste após a compreensão dos dados.

| Métrica | Definição |
|---|---|
| Atraso na entrega (dias) | `order_delivered_customer_date` − `order_estimated_delivery_date` |
| Pedido atrasado | Pedido entregue com atraso > 0 dias em relação à data estimada. **A definir:** comparar por *timestamp* ou por *data* (`::date`); o notebook 01 (Q14 e Q21) quantifica a diferença |
| Lead time (dias) | `order_delivered_customer_date` − `order_purchase_timestamp` |
| Nota média | Média de `review_score` (1 a 5) |
| % de avaliações negativas | Proporção de avaliações com `review_score` ≤ 2 |

---

## 🔍 Metodologia

1. **Coleta e Compreensão dos dados:** 🔄 _em andamento_: schema e carga no PostgreSQL (`sql/01` e `sql/02`), 25 consultas de compreensão (`sql/03` e `notebooks/01_coleta_compreensao_dados.ipynb`) e dicionário de dados (`docs/dicionario_de_dados.md`). Resultados a registrar após a execução.
2. **Limpeza e Preparação dos dados:** ⏳ _pendente_
3. **Análise Exploratória de Dados (EDA):** ⏳ _pendente_
4. **Visualização dos Dados:** ⏳ _pendente_
5. **Validação:** ⏳ _pendente_

---

## ⚠️ Limitações e próximos passos

**Limitações**

- _a preencher ao longo do projeto_

**Próximos passos**

- _a preencher ao longo do projeto_

---

## 📁 Estrutura do repositório

```text
├── data/
│   ├── raw/           # CSVs originais do Kaggle (não versionados)
│   └── processed/     # Dados tratados (gerados pelos notebooks)
├── docs/
│   └── dicionario_de_dados.md          # Tabelas, colunas, tipos e relações
├── sql/
│   ├── 01_create_tables.sql            # Schema "olist" e 9 tabelas
│   ├── 02_load_data.sql                # Carga dos CSVs (\copy) e índices
│   └── 03_data_understanding.sql       # 25 consultas de compreensão e qualidade
├── notebooks/
│   └── 01_coleta_compreensao_dados.ipynb   # Executa as consultas e registra achados
│                                           # (próximos: limpeza e EDA)
├── powerbi/           # Arquivo .pbix e documentação do painel
├── images/            # Gráficos e imagens utilizados no README
├── requirements.txt
└── README.md
```

> A estrutura será ajustada conforme o projeto avança.

## ▶️ Como reproduzir

```bash
# Clone o repositório
git clone [URL_DO_REPOSITORIO]

# Acesse a pasta do projeto
cd [NOME_DO_REPOSITORIO]

# Instale as dependências
pip install -r requirements.txt

# 1) Baixe os CSVs do Kaggle e salve em data/raw/

# 2) Crie o banco e carregue os dados (execute a partir da raiz do repositório)
createdb olist
psql -d olist -f sql/01_create_tables.sql
psql -d olist -f sql/02_load_data.sql

# 3) Defina as variáveis de conexão e abra o notebook
export PGHOST=localhost PGPORT=5432 PGDATABASE=olist PGUSER=postgres PGPASSWORD=sua_senha
jupyter notebook notebooks/01_coleta_compreensao_dados.ipynb
```

> No Windows (PowerShell), use `$env:PGPASSWORD="sua_senha"` em vez de `export`. Os passos das etapas seguintes serão adicionados conforme o projeto avança.

<!-- Detalhar passos específicos (PostgreSQL, ordem dos notebooks, Power BI) ao final do projeto. -->

---

## 👤 Autor

**[Seu nome]**: [LinkedIn](https://linkedin.com/in/seu-perfil) · [GitHub](https://github.com/seu-usuario)
