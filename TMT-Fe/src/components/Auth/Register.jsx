import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import { register } from "../../api/auth";

export default function Register() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await register({ name, email, password });
      toast.success("Đăng ký thành công!");
      navigate("/login");
    } catch (error) {
      toast.error(error.message || "Đăng ký thất bại!");
      console.error("Lỗi khi gửi yêu cầu:", error);
    }
  };

  return (
    <div className="max-w-md mx-auto mt-40">
      <h2 className="text-center text-2xl">Đăng ký</h2>
      <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow">
        <input
          type="text"
          placeholder="Tên"
          className="w-full p-2 border mb-4"
          value={name}
          onChange={(e) => setName(e.target.value)}
          required
        />
        <input
          type="email"
          placeholder="Email"
          className="w-full p-2 border mb-4"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Mật khẩu"
          className="w-full p-2 border mb-4"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          required
        />
        <button className="w-full bg-green-500 text-white p-2">Đăng ký</button>
      </form>
    </div>
  );
}
