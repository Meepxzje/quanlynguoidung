# Sử dụng Node.js image
FROM node:18-alpine

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy package.json và package-lock.json
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ code vào container
COPY . .

# Mở cổng 5173 cho Vite
EXPOSE 5173

# Chạy ứng dụng
CMD ["npm", "run", "dev", "--", "--host"]
