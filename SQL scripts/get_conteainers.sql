SELECT 
    Id,
    Number,
    Type,
    Length,
    Width,
    Height,
    Weight,
    IsEmpty,
    ArrivalDate
FROM 
    Containers
FOR JSON PATH, ROOT('Containers')