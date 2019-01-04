########################################################
##################### LOAD LIBRARY #####################
########################################################

library(googleVis)

########################################################
################## CREATE DATA FRAMES ##################
########################################################

plot1.from <-   c("Other Income (8,450)",
                  "Job #1 Income (51,620)",
                  "Job #2 Income (9,722)",
                  "Job #1 Income (51,620)",
                  "Job #2 Income (9,722)",
                  "Net Income (50,494)",
                  "Net Income (50,494)",
                  "Net Income (50,494)",
                  "Net Income (50,494)",
                  "Deductions (19,298)",
                  "Deductions (19,298)",
                  "Deductions (19,298)",
                  "Deductions (19,298)")
plot1.to <-     c("Net Income (50,494)",
                  "Net Income (50,494)",
                  "Net Income (50,494)",
                  "Deductions (19,298)",
                  "Deductions (19,298)",
                  "Monthly Expenses (14,827)",
                  "Daily Expenses (12,022)",
                  "Other Expenses (3,388)",
                  "Savings (20,257)",
                  "Pension Contributions (4,527)",
                  "Income Tax (9,837)",
                  "CPP and EI (3,879)",
                  "Other Deductions (1,055)")
plot1.weight <- c(8450,
                  34442,
                  7601,
                  17178,
                  2121,
                  14827,
                  12022,
                  3388,
                  20257,
                  4527,
                  9837,
                  3879,
                  1055)

plot2.from <-   c("Monthly Expenses (14,827)",
                  "Monthly Expenses (14,827)",
                  "Monthly Expenses (14,827)",
                  "Monthly Expenses (14,827)",
                  "Monthly Expenses (14,827)",
                  "Monthly Expenses (14,827)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Daily Expenses (12,022)",
                  "Other Expenses (3,388)",
                  "Other Expenses (3,388)",
                  "Other Expenses (3,388)",
                  "Other Expenses (3,388)",
                  "Other Expenses (3,388)")
plot2.to <-     c("Rent (12,557)",
                  "Insurance (1,120)",
                  "Phone (557)",
                  "Utilities (243)",
                  "Gym (230)",
                  "Spotify (120)",
                  "Restaurants (2,996)",
                  "Groceries (2,580)",
                  "Clothing and Accessories (2,038)",
                  "Fuel (1,520)",
                  "Household (905)",
                  "Gifts and Donations (790)",
                  "Transportation (455)",
                  "Alcohol (400)",
                  "Personal Care (338)",
                  "Events (1,187)",
                  "Vacations (838)",
                  "Other (717)",
                  "Vehicle (512)",
                  "Medical (134)")
plot2.weight <- c(12557,
                  1120,
                  557,
                  243,
                  230,
                  120,
                  2996,
                  2580,
                  2038,
                  1520,
                  905,
                  790,
                  455,
                  400,
                  338,
                  1187,
                  838,
                  717,
                  512,
                  134)

plot1.data <- data.frame(plot1.from, plot1.to, plot1.weight)
plot2.data <- data.frame(plot2.from, plot2.to, plot2.weight)

########################################################
##################### CREATE PLOTS #####################
########################################################

plot1 <- gvisSankey(plot1.data, from="plot1.from", to="plot1.to", weight="plot1.weight",
                    options=list(
                      width=800,
                      sankey="{
                        iterations: 0,
                        link: {colorMode: 'gradient'},
                        node: {label: {fontName: 'Cambria', fontSize: 12, bold: true, color: '#0000000'},
                               nodePadding: 10,
                               colors: ['#5E2589',
                                        '#1A237E',
                                        '#5E2589',
                                        '#5E2589',
                                        '#E66400',
                                        '#CD1F1F',
                                        '#CD1F1F',
                                        '#CD1F1F',
                                        '#217227',
                                        '#217227',
                                        '#696969',
                                        '#696969',
                                        '#696969']}}"))

colors_link <- c('#CEBDDB', '#F7D0B2', '#BCD4BE')
colors_link_array <- paste0("[", paste0("'", colors_link,"'", collapse = ','), "]")
colors_node <- c('#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589',
                 '#E66400', '#E66400', '#E66400', '#E66400', '#E66400', '#E66400', '#E66400', '#E66400', '#E66400', '#E66400',
                 '#217227', '#217227', '#217227', '#217227', '#217227', '#217227')
colors_node_array <- paste0("[", paste0("'", colors_node,"'", collapse = ','), "]")
opts <- paste0("{iterations: 0,
                 link: {colorMode: 'source', colors: ", colors_link_array ,"},
                 node: {label: {fontName: 'Cambria', fontSize: 10, bold: true, color: '#0000000'},
                        nodePadding: 10,
                        colors: ", colors_node_array ,"}}")


plot2 <- gvisSankey(plot2.data, from="plot2.from", to="plot2.to", weight="plot2.weight",
                    options=list(width=800, sankey=opts))

########################################################
################### CONSTRUCT PLOTS ####################
########################################################

plot(plot1)
plot(plot2)
