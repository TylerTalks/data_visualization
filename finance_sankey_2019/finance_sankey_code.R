########################################################
##################### LOAD LIBRARY #####################
########################################################

library(googleVis)

########################################################
################## CREATE DATA FRAMES ##################
########################################################

plot1.from <-   c("Other Income (9,420)",
                  "Job Income (95,010)",
                  "Job Income (95,010)",
                  "Net Income (72,240)",
                  "Net Income (72,240)",
                  "Net Income (72,240)",
                  "Net Income (72,240)",
                  "Deductions (32,190)",
                  "Deductions (32,190)",
                  "Deductions (32,190)")
plot1.to <-     c("Net Income (72,240)",
                  "Net Income (72,240)",
                  "Deductions (32,190)",
                  "Monthly Expenses (15,340)",
                  "Daily Expenses (13,650)",
                  "Other Expenses (6,240)",
                  "Savings (37,010)",
                  "Employer Pension (8,550)",
                  "Income Tax (18,510)",
                  "Social Security and Other Deductions (5,130)")
plot1.weight <- c(9420,
                  62820,
                  32190,
                  15340,
                  13650,
                  6240,
                  37010,
                  8550,
                  18510,
                  5130)

plot2.from <-   c("Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Monthly Expenses (15,340)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Daily Expenses (13,650)",
                  "Other Expenses (6,240)",
                  "Other Expenses (6,240)",
                  "Other Expenses (6,240)",
                  "Other Expenses (6,240)",
                  "Other Expenses (6,240)")
plot2.to <-     c("Rent (12,690)",
                  "Phone (790)",
                  "Insurance (750)",
                  "Gym (680)",
                  "Utilities (270)",
                  "Internet (100)",
                  "Spotify (60)",
                  "Restaurants (3,200)",
                  "Groceries (2,440)",
                  "Household (2,300)",
                  "Gifts and Donations (1,620)",
                  "Fuel (1,530)",
                  "Transportation (770)",
                  "Clothing (670)",
                  "Alcohol (570)",
                  "Personal Care (550)",
                  "Vacations (4,080)",
                  "Medical (470)",
                  "Vehicle (440)",
                  "Events (420)",
                  "Other (830)")
plot2.weight <- c(12690,
                  790,
                  750,
                  680,
                  270,
                  100,
                  60,
                  3200,
                  2440,
                  2300,
                  1620,
                  1530,
                  770,
                  670,
                  570,
                  550,
                  4080,
                  470,
                  440,
                  420,
                  830)

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
                                        '#E66400',
                                        '#CD1F1F',
                                        '#CD1F1F',
                                        '#CD1F1F',
                                        '#217227',
                                        '#217227',
                                        '#696969',
                                        '#696969']}}"))

colors_link <- c('#CEBDDB', '#F7D0B2', '#BCD4BE')
colors_link_array <- paste0("[", paste0("'", colors_link,"'", collapse = ','), "]")
colors_node <- c('#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589', '#5E2589',
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
