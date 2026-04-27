<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSTL Formatting Library (fmt) - Format Dates & Numbers</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            margin: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .content { padding: 30px; }
        .section { margin-bottom: 40px; border-left: 5px solid #667eea; padding-left: 20px; }
        .section h2 { color: #667eea; margin-bottom: 15px; }
        .subsection { background: #f8f9fa; padding: 15px; margin: 10px 0; border-radius: 5px; border-left: 3px solid #764ba2; }
        .code-block { background: #2c3e50; color: #ecf0f1; padding: 15px; border-radius: 5px; margin: 10px 0; font-family: monospace; overflow-x: auto; }
        .output { background: #e8f5e9; border-left: 4px solid #4caf50; padding: 12px; margin: 10px 0; border-radius: 3px; color: #2e7d32; }
        table { width: 100%; border-collapse: collapse; margin: 10px 0; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: left; }
        th { background-color: #667eea; color: white; }
        .badge { display: inline-block; background: #667eea; color: white; padding: 5px 10px; border-radius: 20px; font-size: 0.85em; margin: 3px; }
        footer { background: #f8f9fa; padding: 20px; text-align: center; color: #666; border-top: 1px solid #ddd; }
    </style>
</head>

<body>
    <div class="container">
        <header>
            <h1>📅 JSTL Formatting Library Demonstration</h1>
            <p>Format Dates, Numbers, Currency & Localization (prefix: fmt)</p>
        </header>
        
        <div class="content">
            
            <!-- DATE FORMATTING -->
            <div class="section">
                <h2>1. Date Formatting with &lt;fmt:formatDate&gt;</h2>
                <p>Format dates in various styles and patterns</p>
                
                <!-- Set current date -->
                <c:set var="now" value="<%= new java.util.Date() %>" scope="page"/>
                
                <div class="subsection">
                    <h3>Default Date Formatting</h3>
                    <div class="code-block">
&lt;c:set var="now" value="&lt;%= new java.util.Date() %&gt;"/&gt;
&lt;fmt:formatDate value="${now}"/&gt;
                    </div>
                    <div class="output">
                        <strong>Current Date (default):</strong> <fmt:formatDate value="${now}"/><br>
                        <strong>Raw Date:</strong> ${now}
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Date with Different Styles</h3>
                    <div class="code-block">
&lt;fmt:formatDate value="${now}" type="date" dateStyle="SHORT"/&gt;
&lt;fmt:formatDate value="${now}" type="date" dateStyle="MEDIUM"/&gt;
&lt;fmt:formatDate value="${now}" type="date" dateStyle="LONG"/&gt;
&lt;fmt:formatDate value="${now}" type="date" dateStyle="FULL"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Style</th>
                                <th>Formatted Date</th>
                            </tr>
                            <tr>
                                <td><strong>SHORT</strong></td>
                                <td><fmt:formatDate value="${now}" type="date" dateStyle="SHORT"/></td>
                            </tr>
                            <tr>
                                <td><strong>MEDIUM</strong></td>
                                <td><fmt:formatDate value="${now}" type="date" dateStyle="MEDIUM"/></td>
                            </tr>
                            <tr>
                                <td><strong>LONG</strong></td>
                                <td><fmt:formatDate value="${now}" type="date" dateStyle="LONG"/></td>
                            </tr>
                            <tr>
                                <td><strong>FULL</strong></td>
                                <td><fmt:formatDate value="${now}" type="date" dateStyle="FULL"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Time Formatting</h3>
                    <div class="code-block">
&lt;fmt:formatDate value="${now}" type="time" timeStyle="SHORT"/&gt;
&lt;fmt:formatDate value="${now}" type="time" timeStyle="LONG"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Time Style</th>
                                <th>Formatted Time</th>
                            </tr>
                            <tr>
                                <td><strong>SHORT</strong></td>
                                <td><fmt:formatDate value="${now}" type="time" timeStyle="SHORT"/></td>
                            </tr>
                            <tr>
                                <td><strong>MEDIUM</strong></td>
                                <td><fmt:formatDate value="${now}" type="time" timeStyle="MEDIUM"/></td>
                            </tr>
                            <tr>
                                <td><strong>LONG</strong></td>
                                <td><fmt:formatDate value="${now}" type="time" timeStyle="LONG"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Date and Time Combined</h3>
                    <div class="code-block">
&lt;fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="SHORT"/&gt;
&lt;fmt:formatDate value="${now}" type="both" dateStyle="LONG" timeStyle="LONG"/&gt;
                    </div>
                    <div class="output">
                        <strong>Date & Time (MEDIUM/SHORT):</strong> <fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="SHORT"/><br>
                        <strong>Date & Time (LONG/LONG):</strong> <fmt:formatDate value="${now}" type="both" dateStyle="LONG" timeStyle="LONG"/>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Custom Date Pattern</h3>
                    <div class="code-block">
&lt;fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/&gt;
&lt;fmt:formatDate value="${now}" pattern="dd/MM/yyyy hh:mm:ss a"/&gt;
&lt;fmt:formatDate value="${now}" pattern="EEEE, MMMM dd, yyyy"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Pattern</th>
                                <th>Output</th>
                            </tr>
                            <tr>
                                <td>yyyy-MM-dd</td>
                                <td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <tr>
                                <td>dd/MM/yyyy hh:mm:ss a</td>
                                <td><fmt:formatDate value="${now}" pattern="dd/MM/yyyy hh:mm:ss a"/></td>
                            </tr>
                            <tr>
                                <td>EEEE, MMMM dd, yyyy</td>
                                <td><fmt:formatDate value="${now}" pattern="EEEE, MMMM dd, yyyy"/></td>
                            </tr>
                            <tr>
                                <td>MMM dd, yyyy 'at' HH:mm</td>
                                <td><fmt:formatDate value="${now}" pattern="MMM dd, yyyy 'at' HH:mm"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- NUMBER FORMATTING -->
            <div class="section">
                <h2>2. Number Formatting with &lt;fmt:formatNumber&gt;</h2>
                <p>Format numbers with specific decimal places and patterns</p>
                
                <c:set var="price" value="1234.567" scope="page"/>
                <c:set var="percentage" value="0.856" scope="page"/>
                
                <div class="subsection">
                    <h3>Basic Number Formatting</h3>
                    <div class="code-block">
&lt;c:set var="price" value="1234.567"/&gt;
&lt;fmt:formatNumber value="${price}"/&gt;
&lt;fmt:formatNumber value="${price}" maxFractionDigits="2"/&gt;
&lt;fmt:formatNumber value="${price}" maxFractionDigits="3"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Format Description</th>
                                <th>Result</th>
                            </tr>
                            <tr>
                                <td>Default</td>
                                <td><fmt:formatNumber value="${price}"/></td>
                            </tr>
                            <tr>
                                <td>2 Decimal Places</td>
                                <td><fmt:formatNumber value="${price}" maxFractionDigits="2"/></td>
                            </tr>
                            <tr>
                                <td>3 Decimal Places</td>
                                <td><fmt:formatNumber value="${price}" maxFractionDigits="3"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Currency Formatting</h3>
                    <div class="code-block">
&lt;fmt:formatNumber value="${price}" type="currency"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency" currencyCode="USD"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency" currencyCode="EUR"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency" currencyCode="GBP"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Currency</th>
                                <th>Formatted Value</th>
                            </tr>
                            <tr>
                                <td><strong>Default</strong></td>
                                <td><fmt:formatNumber value="${price}" type="currency"/></td>
                            </tr>
                            <tr>
                                <td><strong>USD</strong></td>
                                <td><fmt:formatNumber value="${price}" type="currency" currencyCode="USD"/></td>
                            </tr>
                            <tr>
                                <td><strong>EUR</strong></td>
                                <td><fmt:formatNumber value="${price}" type="currency" currencyCode="EUR"/></td>
                            </tr>
                            <tr>
                                <td><strong>GBP</strong></td>
                                <td><fmt:formatNumber value="${price}" type="currency" currencyCode="GBP"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Percentage Formatting</h3>
                    <div class="code-block">
&lt;c:set var="percentage" value="0.856"/&gt;
&lt;fmt:formatNumber value="${percentage}" type="percent"/&gt;
&lt;fmt:formatNumber value="${percentage}" type="percent" maxFractionDigits="2"/&gt;
                    </div>
                    <div class="output">
                        <strong>Percentage (default):</strong> <fmt:formatNumber value="${percentage}" type="percent"/><br>
                        <strong>Percentage (2 decimals):</strong> <fmt:formatNumber value="${percentage}" type="percent" maxFractionDigits="2"/>
                    </div>
                </div>
                
                <div class="subsection">
                    <h3>Custom Number Pattern</h3>
                    <div class="code-block">
&lt;fmt:formatNumber value="${price}" pattern="###,##0.00"/&gt;
&lt;fmt:formatNumber value="${price}" pattern="#,###.##"/&gt;
&lt;fmt:formatNumber value="${price}" pattern="$#,##0.00"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Pattern</th>
                                <th>Output</th>
                            </tr>
                            <tr>
                                <td>###,##0.00</td>
                                <td><fmt:formatNumber value="${price}" pattern="###,##0.00"/></td>
                            </tr>
                            <tr>
                                <td>#,###.##</td>
                                <td><fmt:formatNumber value="${price}" pattern="#,###.##"/></td>
                            </tr>
                            <tr>
                                <td>$#,##0.00</td>
                                <td><fmt:formatNumber value="${price}" pattern="$#,##0.00"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- PARSEDATE -->
            <div class="section">
                <h2>3. Parse Date with &lt;fmt:parseDate&gt;</h2>
                <p>Convert string to date objects</p>
                
                <div class="subsection">
                    <h3>Parse Date from String</h3>
                    <div class="code-block">
&lt;fmt:parseDate value="22/04/2026" pattern="dd/MM/yyyy" var="parsedDate"/&gt;
Parsed Date: &lt;fmt:formatDate value="${parsedDate}" type="date" dateStyle="LONG"/&gt;
                    </div>
                    <div class="output">
                        <fmt:parseDate value="22/04/2026" pattern="dd/MM/yyyy" var="parsedDate"/>
                        <strong>Parsed Date:</strong> <fmt:formatDate value="${parsedDate}" type="date" dateStyle="LONG"/>
                    </div>
                </div>
            </div>
            
            <!-- PARSENUMBER -->
            <div class="section">
                <h2>4. Parse Number with &lt;fmt:parseNumber&gt;</h2>
                <p>Convert string to number objects</p>
                
                <div class="subsection">
                    <h3>Parse Number from String</h3>
                    <div class="code-block">
&lt;fmt:parseNumber value="1,234.56" pattern="#,###.##" var="parsedNum"/&gt;
Parsed Number: ${parsedNum}
                    </div>
                    <div class="output">
                        <fmt:parseNumber value="1,234.56" pattern="#,###.##" var="parsedNum"/>
                        <strong>Parsed Number:</strong> ${parsedNum}<br>
                        <strong>Plus 100:</strong> ${parsedNum + 100}
                    </div>
                </div>
            </div>
            
            <!-- TIMEZONE -->
            <div class="section">
                <h2>5. Timezone Handling with &lt;fmt:timeZone&gt;</h2>
                <p>Format dates in different timezones</p>
                
                <div class="subsection">
                    <h3>Display Same Time in Different Timezones</h3>
                    <div class="code-block">
&lt;fmt:timeZone value="UTC"&gt;
  &lt;fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/&gt;
&lt;/fmt:timeZone&gt;

&lt;fmt:timeZone value="America/New_York"&gt;
  &lt;fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/&gt;
&lt;/fmt:timeZone&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Timezone</th>
                                <th>Current Date & Time</th>
                            </tr>
                            <tr>
                                <td><strong>UTC</strong></td>
                                <td>
                                    <fmt:timeZone value="UTC">
                                        <fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/>
                                    </fmt:timeZone>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>America/New_York</strong></td>
                                <td>
                                    <fmt:timeZone value="America/New_York">
                                        <fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/>
                                    </fmt:timeZone>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Asia/Tokyo</strong></td>
                                <td>
                                    <fmt:timeZone value="Asia/Tokyo">
                                        <fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/>
                                    </fmt:timeZone>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>Europe/London</strong></td>
                                <td>
                                    <fmt:timeZone value="Europe/London">
                                        <fmt:formatDate value="${now}" type="both" dateStyle="MEDIUM" timeStyle="LONG"/>
                                    </fmt:timeZone>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- LOCALIZATION -->
            <div class="section">
                <h2>6. Localization with &lt;fmt:setLocale&gt;</h2>
                <p>Set locale for formatting dates and numbers</p>
                
                <div class="subsection">
                    <h3>Format with Different Locales</h3>
                    <div class="code-block">
&lt;fmt:setLocale value="en_US"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency"/&gt;

&lt;fmt:setLocale value="de_DE"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency"/&gt;

&lt;fmt:setLocale value="fr_FR"/&gt;
&lt;fmt:formatNumber value="${price}" type="currency"/&gt;
                    </div>
                    <div class="output">
                        <table>
                            <tr>
                                <th>Locale</th>
                                <th>Currency Format</th>
                            </tr>
                            <tr>
                                <td><strong>en_US</strong></td>
                                <td>
                                    <fmt:setLocale value="en_US"/>
                                    <fmt:formatNumber value="${price}" type="currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>de_DE</strong></td>
                                <td>
                                    <fmt:setLocale value="de_DE"/>
                                    <fmt:formatNumber value="${price}" type="currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>fr_FR</strong></td>
                                <td>
                                    <fmt:setLocale value="fr_FR"/>
                                    <fmt:formatNumber value="${price}" type="currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td><strong>ja_JP</strong></td>
                                <td>
                                    <fmt:setLocale value="ja_JP"/>
                                    <fmt:formatNumber value="${price}" type="currency"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            
            <!-- PRACTICAL EXAMPLE -->
            <div class="section">
                <h2>🎯 Practical Example: Invoice Display</h2>
                <p>Real-world formatting use case</p>
                
                <%
                    Calendar cal = Calendar.getInstance();
                    cal.set(2026, Calendar.APRIL, 22);
                    Date invoiceDate = cal.getTime();
                    request.setAttribute("invoiceDate", invoiceDate);
                %>
                
                <fmt:setLocale value="en_US"/>
                <div class="output">
                    <h3>💳 Invoice Report</h3>
                    <table>
                        <tr>
                            <td><strong>Invoice Date:</strong></td>
                            <td><fmt:formatDate value="${invoiceDate}" type="date" dateStyle="LONG"/></td>
                        </tr>
                        <tr>
                            <td><strong>Invoice Time:</strong></td>
                            <td><fmt:formatDate value="${now}" type="time" timeStyle="SHORT"/></td>
                        </tr>
                    </table>
                    
                    <h4>Items:</h4>
                    <table>
                        <tr>
                            <th>Description</th>
                            <th>Quantity</th>
                            <th>Unit Price</th>
                            <th>Total</th>
                        </tr>
                        <tr>
                            <td>Java Course</td>
                            <td>1</td>
                            <td><fmt:formatNumber value="5000" type="currency" currencyCode="USD"/></td>
                            <td><fmt:formatNumber value="5000" type="currency" currencyCode="USD"/></td>
                        </tr>
                        <tr>
                            <td>JSP Course</td>
                            <td>1</td>
                            <td><fmt:formatNumber value="3000" type="currency" currencyCode="USD"/></td>
                            <td><fmt:formatNumber value="3000" type="currency" currencyCode="USD"/></td>
                        </tr>
                        <tr>
                            <td>JSTL Advanced</td>
                            <td>1</td>
                            <td><fmt:formatNumber value="2500" type="currency" currencyCode="USD"/></td>
                            <td><fmt:formatNumber value="2500" type="currency" currencyCode="USD"/></td>
                        </tr>
                        <tr style="background: #e8f5e9;">
                            <td colspan="3"><strong>TOTAL</strong></td>
                            <td><strong><fmt:formatNumber value="10500" type="currency" currencyCode="USD"/></strong></td>
                        </tr>
                        <tr style="background: #fff3e0;">
                            <td colspan="3"><strong>TAX (10%)</strong></td>
                            <td><strong><fmt:formatNumber value="1050" type="currency" currencyCode="USD"/></strong></td>
                        </tr>
                        <tr style="background: #f3e5f5;">
                            <td colspan="3"><strong>GRAND TOTAL</strong></td>
                            <td><strong><fmt:formatNumber value="11550" type="currency" currencyCode="USD"/></strong></td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
        
        <footer>
            <p><strong>JSTL Formatting Library (fmt) Demonstration</strong> | COHORT 12 Training Portal</p>
            <p>Formatting Tags: fmt:formatDate | fmt:formatNumber | fmt:parseDate | fmt:parseNumber | fmt:timeZone | fmt:setLocale</p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 10px 0;">
            <p style="font-size: 0.9em;">
                <strong>Key Concepts:</strong> Date Patterns | Number Formats | Currency Codes | Localization | Timezone Handling | Parsing Strings
            </p>
        </footer>
    </div>
</body>

</html>
