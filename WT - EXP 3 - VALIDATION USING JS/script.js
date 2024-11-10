function validateForm() {
    const form = document.getElementById('parkingForm');
    
    // Validate name: should not contain numbers
    const name = document.getElementById('name').value;
    if (/\d/.test(name)) {
        alert('Name should not contain numbers.');
        return false;
    }

    // Validate email format: basic email pattern check
    const email = document.getElementById('email').value;
    const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert('Please enter a valid email address.');
        return false;
    }

    // Validate parking time: "To" must be after "From"
    const parkingTimeFrom = document.getElementById('parkingTimeFrom').value;
    const parkingTimeTo = document.getElementById('parkingTimeTo').value;
    if (new Date(parkingTimeFrom) >= new Date(parkingTimeTo)) {
        alert('Parking time "To" must be after "From" time.');
        return false;
    }
    return true;
}
