# Indicator Manager - ⚠️Prototype⚠️

**Indicator Manager** is a **prototype** designed to demonstrate how a harmonized catalog of indicators could function. It allows users to organize, explore, and manage indicators grouped by sectors, themes, and SDGs, offering an interactive and user-friendly experience. While fully functional, **this prototype was built for demonstration purposes and is not intended for production use**.

---

![image](https://github.com/user-attachments/assets/f8d280cb-c7f0-4341-93db-654c0afccd1c)

---

## 🔗 Demo 

A demo version is available under https://www.henriod.info/dsc

---

## 💡 Purpose

This prototype aims to illustrate the potential usefulness of a centralized indicator catalog for projects and organizations. It showcases features that could be expanded and refined in a production-ready version of the tool.

---

## 🚧 Limitations of the Prototype

- **No Production Features**: This version does not include critical production-ready features, such as user authentication or advanced security measures.
- **Demonstration Focus**: The architecture and codebase were designed for rapid prototyping and proof-of-concept purposes rather than for scalability or long-term use.
- **Recommendation**: If you intend to use an indicator catalog in a real-world context, we strongly recommend developing a new version from scratch, following best practices in architecture, security, and coding.

---

## 📋 Features

- **Dynamic Organization**: Indicators are grouped by sector and theme, with expandable/collapsible sections for easy navigation.
![image](https://github.com/user-attachments/assets/1af139e5-8481-4de3-9cb0-913e785222f8)
- **Interactive Search and Filter**: Quickly find indicators based on keywords, concepts, SDGs, or packages.
- ![image](https://github.com/user-attachments/assets/d3b4d67f-fdb2-4c81-b6ab-81f3af8f5ddc)
- **SDG Integration**: Each indicator links to its related SDG, with tooltips for descriptions and quick links to SDG details.
- **Indicator Selection and Export**: Select indicators for review and export them in a structured CSV format.
![image](https://github.com/user-attachments/assets/8a016931-ff5e-4792-906b-c5e19113c830)
- **Identification of Possible Duplicates**: The system now includes a mechanism to highlight potential duplicate indicators, allowing users to export them for further analysis.
![image](https://github.com/user-attachments/assets/599276d9-8b4c-487b-bb97-a81b52dcb275)

---

## 💻 Installation

To explore the prototype locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/shenriod/IndicatorManager.git
   cd IndicatorManager
   ```

2. **Set Up a Local Web Server**:
   Use a web server like Apache or Nginx with PHP support enabled.

3. **Configure the Database**:
   - The SQLite database file and schema are in the `/db` directory.
   - Ensure the server has read/write access to the database file.

4. **Launch the Prototype**:
   Place the project folder in your web server’s document root and navigate to `http://localhost/IndicatorManager` in your browser.

---

## 📁 File Structure

- `/api/`: Backend PHP scripts for retrieving indicators.
  - get_indicators.php: Fetches all indicators.
  - get_possible_duplicates.php: Retrieves potential duplicate indicators.
- `/db/`: SQLite database and schema.
- `/index.html`: Main page for viewing and filtering indicators.

---

## 📊 Usage

1. **View Indicators**:
   - Browse indicators organized by sectors and themes.
   - Click on related SDGs, concepts, or packages to filter results.

2. **Export Selected Indicators**:
   - Select indicators, and export their details as a CSV file.

3. **Export Possible Duplicates**:
    - Click the "🔁 Export Possible Duplicates" button to generate a CSV file containing indicators that may be redundant.
    
---

## ⏳ Future Considerations

If you plan to develop a production-ready indicator catalog, consider the following:

- **Robust Security**: Implement user authentication, role-based access control, and secure data handling.
- **Scalable Architecture**: Use a modern backend framework (e.g., Django, Flask, or Node.js) and a scalable database.
- **Enhanced Features**:
  - Integration with external tools.
  - Advanced visualizations and data analytics.
  - API endpoints for interoperability with other systems.
  - Dynamic connection to an AI-powered script able to recognize the possible duplicates.

---

## ⚠️ Disclaimer

This prototype is **not intended for production use**. It is a demonstration tool to showcase the potential of an indicator catalog. If you wish to use it in real-life scenarios, we recommend rebuilding the system with a production-grade approach.

---

## 🔌 Contributing

We are not in a position to accept any contribution, as this is not a real open-source project. But don't hesitate to fork it, should you be interested to develop it further.

## 💌 Contact

You can contact me through www.henriod.info 
