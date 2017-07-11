# 使用 UNPIVOT 進行商品資料表的轉置作業

此資料庫指令碼商品的尺寸是具有對應時系統可能的設計情況。

使用 UNPIVOT 將資料表的結構進行調整，可符合關聯式資料庫的原則。

> 此資料表設計方式真實存在於線上資料庫系統

### 指令碼說明

|檔案名稱|說明|
|--|--|
|00-sample-database.sql|建立以資料欄位基礎的商品尺寸、庫存資料庫|
|10-use-unpivot-query-size-table.sql|使用 unpivot 將尺寸資料表進行置換|
|11-use-unpivot-query-storage-table.sql|使用 unpivot 將庫存資料表進行置換|

### 範例資料庫物件結構

- dbo.Products
- dbo.ProductStorages
- dbo.Sizes

### 資料表說明

|資料表名稱|描述|
|--|--|
|dbo.Products|商品檔案資料表|
|dbo.ProductStorages|商品庫存資料表|
|dbo.Sizes|商品尺寸資料表|

### 參考資料

https://technet.microsoft.com/en-us/library/ms177410(v=sql.105).aspx
