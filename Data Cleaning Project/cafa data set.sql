-- Remover a linha duplicada de cabeçalho que pode ter sido importada do CSV
DELETE FROM cafe_sales_dirty
WHERE transaction_id = 'Transaction ID';

-- Substituir valores inválidos ('ERROR') por NULL na coluna total_spent
UPDATE cafe_sales_dirty
SET total_spent = NULL
WHERE total_spent = 'ERROR';

-- Substituir valores inválidos ('UNKNOWN') por NULL na coluna total_spent
UPDATE cafe_sales_dirty
SET total_spent = NULL
WHERE total_spent = 'UNKNOWN';

-- Converter a coluna total_spent de texto para tipo numérico
ALTER TABLE cafe_sales_dirty
ALTER COLUMN total_spent TYPE numeric
USING total_spent::numeric;

-- Substituir valores inválidos ('UNKNOWN') por NULL na coluna price_per_unit
UPDATE cafe_sales_dirty
SET price_per_unit = NULL
WHERE price_per_unit = 'UNKNOWN';

-- Substituir valores inválidos ('ERROR') por NULL na coluna price_per_unit
UPDATE cafe_sales_dirty
SET price_per_unit = NULL
WHERE price_per_unit = 'ERROR';

-- Converter a coluna price_per_unit de texto para tipo numérico
ALTER TABLE cafe_sales_dirty
ALTER COLUMN price_per_unit TYPE numeric
USING price_per_unit::numeric;

-- Garantia extra: substituir novamente 'ERROR' por NULL em price_per_unit (caso repetido)
UPDATE cafe_sales_dirty
SET price_per_unit = NULL
WHERE price_per_unit = 'ERROR';

-- Substituir valores inválidos ('ERROR') por NULL na coluna payment_method
UPDATE cafe_sales_dirty
SET payment_method = NULL
WHERE payment_method = 'ERROR';

-- Substituir valores inválidos ('ERROR') por NULL na coluna location
UPDATE cafe_sales_dirty
SET location = NULL
WHERE location = 'ERROR';

-- Substituir valores inválidos ('ERROR') por NULL na coluna transaction_date
UPDATE cafe_sales_dirty
SET transaction_date = NULL
WHERE transaction_date = 'ERROR';

-- Substituir valores inválidos ('UNKNOWN') por NULL na coluna transaction_date
UPDATE cafe_sales_dirty
SET transaction_date = NULL
WHERE transaction_date = 'UNKNOWN';

-- Converter a coluna transaction_date de texto para tipo date
ALTER TABLE cafe_sales_dirty
ALTER COLUMN transaction_date TYPE date 
USING transaction_date::date;

-- Substituir valores inválidos ('UNKNOWN') por NULL na coluna quantity
UPDATE cafe_sales_dirty
SET quantity = NULL
WHERE quantity = 'UNKNOWN';

-- Substituir valores inválidos ('ERROR') por NULL na coluna quantity
UPDATE cafe_sales_dirty
SET quantity = NULL
WHERE quantity = 'ERROR';

-- Converter a coluna quantity de texto para tipo inteiro
ALTER TABLE cafe_sales_dirty
ALTER COLUMN quantity TYPE INTEGER
USING quantity::INTEGER;

-- Substituir valores inválidos ('ERROR') por NULL na coluna item
UPDATE cafe_sales_dirty
SET item = NULL
WHERE item = 'ERROR';

-- Adicionar uma coluna 'id' como chave primária incremental (serial)
ALTER TABLE cafe_sales_dirty
ADD COLUMN id serial PRIMARY KEY;

-- Padronizar texto nas colunas item, payment_method e location:
-- Remover espaços em branco (TRIM) e converter tudo para minúsculo (LOWER)
UPDATE cafe_sales_dirty
SET 
    item = LOWER(TRIM(item)),
    payment_method = LOWER(TRIM(payment_method)),
    location = LOWER(TRIM(location));

	