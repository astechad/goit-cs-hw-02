#!/bin/bash

# Список вебсайтів для перевірки
websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
  "https://www.example.com"  # Додав приклад сайту, який може бути недоступним
  "https://nonexistentsite.example" # Додав приклад неіснуючого сайту
)

# Назва файлу логів
logfile="website_status.log"

# Функція для перевірки доступності сайту
check_website() {
  local url="$1"
  local result=$(curl -s -o /dev/null -w "%{http_code}" -L "$url") # -L обробляє переадресацію, -s приховує іншу інформацію окрім http_code, -o /dev/null приховує тіло відповіді

  if [[ "$result" == "200" ]]; then
    echo "$url is UP" >> "$logfile"
    echo "$url is UP" # Виводимо і в консоль для зручності
  else
    echo "$url is DOWN (HTTP Status: $result)" >> "$logfile"
    echo "$url is DOWN (HTTP Status: $result)" # Виводимо і в консоль для зручності
  fi
}

# Очищаємо файл логів перед початком роботи
> "$logfile"

# Перевіряємо кожен сайт у списку
for website in "${websites[@]}"; do
  check_website "$website"
done

# Виводимо повідомлення про завершення
echo "Результати перевірки записано у файл: $logfile"

exit 0
