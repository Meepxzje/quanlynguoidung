import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages/HomePage";
import Login from "./components/Auth/Login";
import Register from "./components/Auth/Register";
import UserPage from "./pages/UserPage";
import AdminPage from "./pages/AdminPage";
import { ToastContainer } from "react-toastify";

export default function App() {
  return (
    <>
    <ToastContainer position="bottom-right" />
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/profile" element={<UserPage />} />
        <Route path="/admin" element={<AdminPage />} />
      </Routes>
    </Router>
    </>
  );
}
