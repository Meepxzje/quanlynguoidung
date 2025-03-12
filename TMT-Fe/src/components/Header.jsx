import { Link, Links, useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";

const Header = () => {
  const navigate = useNavigate();
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [isAdmin, setIsAdmin] = useState(false);

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) return;
    setIsLoggedIn(true);

    fetch(`${import.meta.env.VITE_API_URL}/user`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${token}`,
      },
    })
      .then((res) => {
        return res.json();
      })
      .then((data) => {
        if (data.user.role === "admin") {
          setIsAdmin(true);
        }
      });
  }, []);

  const handleLogout = () => {
    localStorage.removeItem("token");
    setIsLoggedIn(false);
    setIsAdmin(false);
    navigate("/login");
  };

  return (
    <header className="bg-gray-500 text-white p-4 flex justify-between">
      <Link to="/" className="text-xl font-bold">
        Trang chủ
      </Link>
      <nav>
        <Link to="/profile" className="mr-4">
          Trang cá nhân
        </Link>
        {isAdmin && (
          <Link to="/admin" className="mr-4">
            Admin
          </Link>
        )}
        {isLoggedIn ? (
          <button onClick={handleLogout} className="text-red-300 underline">
            Đăng xuất
          </button>
        ) : (
          <Link to="/login">Đăng nhập</Link>
        )}
      </nav>
    </header>
  );
};

export default Header;
