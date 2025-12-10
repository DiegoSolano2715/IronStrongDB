USE IronStrongFitness;
GO

-- 7. Pagos
CREATE TABLE Pagos (
    IdPago INT IDENTITY PRIMARY KEY,
    IdContrato INT,
    Monto DECIMAL(10,2),
    FechaPago DATE,
    FOREIGN KEY (IdContrato) REFERENCES Contratos(IdContrato)
);

INSERT INTO Pagos (IdContrato, Monto, FechaPago) VALUES
(1, 50,  DATEADD(DAY, -2, GETDATE())),
(1, 60,  DATEADD(DAY, -10, GETDATE())),
(1, 70,  DATEADD(DAY, -15, GETDATE()));

select * from Pagos;