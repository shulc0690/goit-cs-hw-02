#!/bin/bash

# Крок 1: Список вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com" "https://somesite.com")

# Ім'я файлу логів
log_file="website_status.log"

# Очищуємо файл логів перед новою перевіркою
> "$log_file"

# Крок 2 та 3: Перевірка доступності та запис результатів у файл
for website in "${websites[@]}"; do
    response=$(curl -Ls -o /dev/null -w "%{http_code}" "$website")
    if echo "$response" | grep -q 200; then
        status="[$website] is UP"
    else
        status="[$website] is DOWN"
    fi
    echo "$status" >> "$log_file"
done

# Крок 4: Вивід інформації
echo "Results have been logged in $log_file"
