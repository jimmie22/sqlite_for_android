#include <sqlite3.h>

static int callback(void *NotUsed, int argc, char **argv, char **azColName) {
	int i;
	for (i = 0; i < argc; ++i) {
		printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
	}
	printf("\n");
	return 0;
}
int main(int argc, char **argv) {
	char create_table[100] = "CREATE TABLE IF NOT EXISTS customers (id INTEGER PRIMARY KEY,name TEXT NOT NULL)";
	char insert_value[100] = "INSERT INTO customers VALUES('1', 'roman10')";
	sqlite3 *db;
	char *errMsg;
	int rv;
	if (argc != 2) {
		printf("Usage: %s database\n", argv[0]);
		return 1;
	}
	rv = sqlite3_open(argv[1], &db);
	if (rv) {
		printf("Cannot open database: %s\n", sqlite3_errmsg(db));
		sqlite3_close(db);
		return 1;
	}
	rv = sqlite3_exec(db, create_table, callback, 0, &errMsg);
	if (rv != SQLITE_OK) {
		printf("SQLite statement execution error: %s\n", errMsg);
	}
	rv = sqlite3_exec(db, insert_value, callback, 0, &errMsg);
	if (rv != SQLITE_OK) {
		printf("SQLite statement execution error: %s\n", errMsg);
	}
	sqlite3_close(db);
	return 0;
}
