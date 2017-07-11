--
--使用 UNPIVOT 語法做尺寸對應表轉置
--
SELECT unpivoted.[No]
	,unpivoted.[Code]
	,CONVERT(TINYINT,RIGHT(unpivoted.[ColumnName],2))-1 [Index]
	,unpivoted.[Name]
FROM
(
	SELECT a.[No]
		,a.[Code]
		,a.[Size01]
		,a.[Size02]
		,a.[Size03]
		,a.[Size04]
		,a.[Size05]
		,a.[Size06]
		,a.[Size07]
		,a.[Size08]
		,a.[Size09]
		,a.[Size10]
	FROM [dbo].[Sizes] a with (nolock)
) a
UNPIVOT
(
	[Name] For [ColumnName] IN (
		[Size01]
		,[Size02]
		,[Size03]
		,[Size04]
		,[Size05]
		,[Size06]
		,[Size07]
		,[Size08]
		,[Size09]
		,[Size10]
	)
) AS unpivoted