CREATE TABLE expenses (
	id SERIAL PRIMARY KEY,
	amount DECIMAL(6, 2) NOT NULL,
	memo TEXT NOT NULL,
	created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE expenses ADD CONSTRAINT positive_amount_check CHECK (amount >= 0.01);