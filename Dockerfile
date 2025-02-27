# Використовуємо офіційний образ Python 3.9 як базовий
FROM python:3.9

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо файли requirements.txt та conf/ в робочу директорію
COPY requirements.txt /app/
COPY ./conf /app/conf

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо решту файлів застосунку в робочу директорію
COPY . /app/


# Команда, яка буде виконуватися при запуску контейнера
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]