
def health_check():
    return {"status": "healthy", "service": "container-image-security-scanner"}

if __name__ == "__main__":
    print(health_check())



