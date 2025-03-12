import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { login } from "../../api/auth";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const data = await login({ email, password });
      if (data.token) {
        localStorage.setItem("token", data.token);
        if (data.user.role === "admin") {
          navigate("/admin");
        } else {
          navigate("/");
        }
        toast.success("Đăng nhập thành công!");
      } else {
        toast.error("Sai tài khoản hoặc mật khẩu!");
      }
    } catch (error) {
      toast.error("Lỗi hệ thống");
      console.log(error);
    }
  };

  return (
    <div className="max-w-md mx-auto mt-40">
      <h2 className="text-center text-2xl">Đăng nhập</h2>
      <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow">
        <input
          type="email"
          placeholder="Email"
          className="w-full p-2 border mb-4"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          type="password"
          placeholder="Mật khẩu"
          className="w-full p-2 border mb-4"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <Link to="/register" className="mb-4 text-sm underline text-red-400">
          Đăng ký ngay
        </Link>

        <button className="w-full bg-blue-500 text-white p-2 mt-4">
          Đăng nhập
        </button>
      </form>
    </div>
  );
}
