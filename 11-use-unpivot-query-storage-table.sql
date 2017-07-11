--
--使用 UNPIVOT 語法做庫存轉置
--
SELECT unpivoted.[ProductCode]
	,unpivoted.[ProductSizeCode]
	,CONVERT(TINYINT,RIGHT(unpivoted.[ColumnName],2))-1 [Index]
	,unpivoted.[Storage]
FROM
(
	SELECT b.[Code] [ProductCode]
		,c.[Code] [ProductSizeCode]
		,a.[Storage01]
		,a.[Storage02]
		,a.[Storage03]
		,a.[Storage04]
		,a.[Storage05]
		,a.[Storage06]
		,a.[Storage07]
		,a.[Storage08]
		,a.[Storage09]
		,a.[Storage10]
	FROM [dbo].[ProductStorages] a with (nolock)
		INNER JOIN [dbo].[Products] b with (nolock) ON a.[ProductNo] = b.[No]
		INNER JOIN [dbo].[Sizes] c with (nolock) ON a.[SizeNo] = c.[No]
) a
UNPIVOT
(
	[Storage] For [ColumnName] IN (
		[Storage01]
		,[Storage02]
		,[Storage03]
		,[Storage04]
		,[Storage05]
		,[Storage06]
		,[Storage07]
		,[Storage08]
		,[Storage09]
		,[Storage10]
	)
) AS unpivoted
GO