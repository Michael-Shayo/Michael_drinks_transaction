        const sidebar = document.getElementById("sidebar");
        const toggleBtn = document.getElementById("toggleBtn");
        const overlay = document.getElementById("overlay");
        const themeBtn = document.getElementById("theme-toggle");
        const savedTheme = localStorage.getItem("theme");


        function toggleSidebar() {
            const isMobile = window.innerWidth <= 768;
            
            if (isMobile) {
                sidebar.classList.toggle("open");
                overlay.classList.toggle("active");

                // 🔥 Disable body scroll when sidebar is open
                if (sidebar.classList.contains("open")) {
                    document.body.classList.add("no-scroll");
                } else {
                    document.body.classList.remove("no-scroll");
                }

                toggleBtn.textContent = sidebar.classList.contains("open") ? "✖" : "☰";
            } else {
                sidebar.classList.toggle("closed");
                toggleBtn.textContent = sidebar.classList.contains("closed") ? "☰" : "✖";
            }
        }

        // Toggle button click
        toggleBtn.addEventListener("click", toggleSidebar);

        // Overlay click closes sidebar (mobile only)
        overlay.addEventListener("click", toggleSidebar);

        // Close sidebar on Backspace (mobile only)
        document.addEventListener("keydown", (e) => {
            if (e.key === "Backspace" && window.innerWidth <= 768 && sidebar.classList.contains("open")) {
                toggleSidebar();
                e.preventDefault();
            }
        });

        if (savedTheme === "dark") {
                document.body.classList.add("dark");

            }
            themeBtn.addEventListener("click", () => {
                document.body.classList.toggle("dark");

                if (document.body.classList.contains("dark")) {
                    localStorage.setItem("theme", "dark");
                } else {
                    localStorage.setItem("theme", "light");
                }

            });
      