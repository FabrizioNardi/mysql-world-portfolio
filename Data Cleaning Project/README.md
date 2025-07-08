
# 🧼 Café Sales – Data Cleaning com SQL

Este projeto tem como objetivo aplicar técnicas de limpeza de dados (`Data Cleaning`) em um conjunto de transações de vendas de uma cafeteria. O processo foi realizado inteiramente em **SQL (PostgreSQL)**, simulando um cenário real de dados sujos importados de arquivos CSV.

---

## 📁 Dataset

O dataset original (`cafe_sales_dirty`) apresenta problemas comuns como:
- Linhas duplicadas de cabeçalho
- Dados categóricos inconsistentes (`'ERROR'`, `'UNKNOWN'`)
- Tipos de dados incorretos (números e datas armazenados como texto)
- Textos com espaços em branco e variação de maiúsculas/minúsculas

---

## 🛠️ Etapas de Limpeza Realizadas

1. **Remoção de linha duplicada de cabeçalho**  
   Ex: `'Transaction ID'` na primeira linha da tabela.

2. **Tratamento de valores inválidos (`'ERROR'` / `'UNKNOWN'`)**  
   Substituídos por `NULL` nas colunas:
   - `total_spent`
   - `price_per_unit`
   - `quantity`
   - `transaction_date`
   - `item`
   - `payment_method`
   - `location`

3. **Conversão de tipos de dados**
   - `total_spent` e `price_per_unit`: `text` → `numeric`
   - `quantity`: `text` → `integer`
   - `transaction_date`: `text` → `date`

4. **Padronização de textos**
   - Remoção de espaços em branco com `TRIM`
   - Conversão para letras minúsculas com `LOWER`
   - Aplicado nas colunas: `item`, `payment_method`, `location`

5. **Criação de chave primária (`id`)**
   - Coluna `serial` adicionada para facilitar identificações e joins futuros.

---

## 🔍 Exemplos de Queries Pós-Limpeza

```sql
-- Top 10 produtos mais vendidos
SELECT item, SUM(quantity) AS total_vendido
FROM cafe_sales_dirty
GROUP BY item
ORDER BY total_vendido DESC
LIMIT 10;

-- Receita total por método de pagamento
SELECT payment_method, SUM(total_spent) AS receita
FROM cafe_sales_dirty
GROUP BY payment_method
ORDER BY receita DESC;

-- Faturamento por localização
SELECT location, SUM(total_spent) AS receita_total
FROM cafe_sales_dirty
GROUP BY location;
```

---

## 💡 Aprendizados

Este projeto demonstrou como dados aparentemente simples podem conter diversas armadilhas para análise, e como o **SQL é uma ferramenta poderosa para limpeza, transformação e padronização de dados**.

---

## 🧠 Tecnologias Utilizadas
- PostgreSQL (via pgAdmin)
- SQL puro (`UPDATE`, `ALTER TABLE`, `DELETE`, `LOWER`, `TRIM`, `CAST`)

---

## 📌 Autor
**Giulia Nardi**  
Estudante de Engenharia de Produção com foco em dados | Projetos com SQL, Power BI e Python  
🔗 [LinkedIn](https://www.linkedin.com/) • [GitHub](https://github.com/)
