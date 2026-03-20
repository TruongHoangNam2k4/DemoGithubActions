# GIAI ĐOẠN 1: BUILD (Sử dụng Maven để biên dịch code)
FROM maven:3.9.11-eclipse-temurin-25 AS builder
WORKDIR /app
COPY . .
# Biên dịch code thành file .jar, bỏ qua unit test để nhanh hơn
RUN mvn package -DskipTests

# GIAI ĐOẠN 2: RUN (Chỉ lấy file thực thi để chạy)
FROM eclipse-temurin:25-jre-jammy
WORKDIR /app
# Chỉ lấy file .jar từ giai đoạn builder
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
# Lệnh khởi chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]