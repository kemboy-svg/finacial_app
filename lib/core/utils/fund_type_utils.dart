String getFundTypeText(int fundType) {
    // Use a switch statement to determine the text based on the enum value
    switch (fundType) {
      case 1:
        return "Money Market";
      case 2:
        return "Registered";
      case 3:
      return "Equity";
      case 4:
        return "Alternative";
      default:
        return ""; // Handle other cases if needed
    }
  }