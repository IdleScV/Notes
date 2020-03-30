fetch('/api/foo')
	.then((response) => {
		if (!response.ok) {
			throw response;
		}
		return response.json(); //we only get here if there is no error
	})
	.then((json) => {
		doSomethingWithResult(json);
	})
	.catch((err) => {
		err.text().then((errorMessage) => {
			displayTheError(errorMessage);
		});
	});
