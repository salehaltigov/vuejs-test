SELECT 
    o.Id,
    o.ContainerId,
    o.StartDate,
    o.EndDate,
    o.OperationType,
    o.OperatorName,
    o.InspectionLocation
FROM 
    Operations o
JOIN 
    Containers c ON o.ContainerId = c.Id
WHERE 
    c.IsEmpty = 0
FOR JSON PATH, ROOT('Operations')