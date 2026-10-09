// 声明 SysY 运行时库函数
int getint();
void putint(int);
void putch(int);

int main() {
    int i, n, f;
    n = getint();   // 输入 n
    i = 2;
    f = 1;
    while (i <= n) {
        f = f * i;
        i = i + 1;
    }
    putint(f);      // 输出阶乘结果
    putch(10);      // 输出换行符 (ASCII 码 10)
    return 0;
}
